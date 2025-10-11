import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_pagination_provider/src/models/paginated_list_response/paginated_list_response.dart';
import 'package:riverpod_pagination_provider/src/models/pagination_page_state/pagination_page_state.dart';
import 'package:riverpod_pagination_provider/src/models/pagination_state/pagination_state.dart';
import 'package:riverpod_pagination_provider/src/utils/pagination_helpers.dart';

import '../models/pagination_page_response/pagination_page_response.dart';
import '../models/pagination_params/pagination_params.dart';
import '../models/pagination_relative_index/pagination_relative_index.dart';
import '../utils/exceptions/pagination_cancel_exception.dart';

enum PaginationUpdateType {
  /// При смене страницы старые страницы очищаются
  clearOthers,

  /// При смене страницы старые загруженные страницы не очищаются но обновляются
  autoUpdateCache,

  /// При смене страницы стырые загруженные страницы не очищаются и не обновляются
  /// Исключением является присутствующая ошибка на странице
  nonUpdateCache,
}

abstract class PaginationNotifierHelper<T, Z, Y> {
  @protected
  Z get initialLoadParams;

  @protected
  Y? readArgs();

  @protected
  Ref<PaginationState<T, Z, Y>> readRefence();

  @protected
  PaginationState<T, Z, Y>? readStateOrNull();

  @protected
  PaginationState<T, Z, Y> readState();

  @protected
  Ref<PaginationState<T, Z, Y>> get ref => readRefence();

  @protected
  PaginationState<T, Z, Y> get state => readState();

  @protected
  PaginationState<T, Z, Y>? get stateOrNull => readStateOrNull();

  @protected
  void changeState(PaginationState<T, Z, Y> newState);
}

mixin PaginationNotifierMixin<T, Z, Y>
    implements PaginationNotifierHelper<T, Z, Y> {
  final Map<int, Completer<PaginationPageResponse<T>>> _pageCompleters = {};

  final Map<int, int> _pageUpdateCount = {};

  Completer<void>? _frameCompleter;

  bool _mustResetToZeroPage = false;

  bool _refreshing = false;

  bool get watchErrors => false;

  bool get autoStart => true;

  int get initialLimit => 10;

  int get initialPage => 0;

  Timer? _throttler;

  Future<PaginatedListResponse<T>> fetchItems(
    Z loadParams,
    PaginationParams paginationParams,
  );

  void _onTotalCountChanged(int totalCount) {
    changeState(
      state.copyWith(
        totalCount: totalCount,
        pageItems: {},
      ),
    );
    refresh();
  }

  void refresh() {
    ref.invalidateSelf();
  }

  void cancelAllLoads() {
    _pageCompleters.clear();
  }

  PaginationRelativeIndex _getRelativeIndex(int index) {
    return PaginationHelpers.getRelativeIndex(
      index,
      state.totalCount,
      state.limit,
    );
  }

  void onItemBuild(int index) {
    if (!hasState || _refreshing) {
      return;
    }
    final completer = Completer();
    _frameCompleter = completer;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (_frameCompleter == completer) {
          final relativeIndex = _getRelativeIndex(index);
          final progress = relativeIndex.pageProgress;
          final page = relativeIndex.page;
          final needUpdateNext = progress - page > 0.5;
          final needUpdatePrevious = page == 0 ? false : progress - page < 0.5;
          final nextPage = state.canPageExist(page + 1) ? page + 1 : null;
          final previousPage = state.canPageExist(page - 1) ? page - 1 : null;
          if (needUpdateNext && nextPage != null) {
            watchPage(nextPage);
          }
          watchPage(page);
          if (needUpdatePrevious && previousPage != null) {
            watchPage(previousPage);
          }
          if (page != state.currentPage) {
            changeState(
              state.copyWith(
                currentPage: page,
              ),
            );
          }
        }
      },
    );
  }

  bool get hasState {
    return stateOrNull != null;
  }

  void watchPage(int page) {
    final canExist = state.canPageExist(page);
    if (_refreshing || !hasState || !canExist) {
      return;
    }
    final pageCompleter = _pageCompleters[page];
    final pageState = state.getPageState(page);
    final hasError = pageState.error != null;
    if (pageCompleter == null || (pageCompleter.isCompleted && hasError)) {
      if (hasError) {
        if (watchErrors) {
          loadPage(page);
        }
      } else {
        loadPage(page);
      }
    }
  }

  Future<(int, List<T>)> loadCountItems({
    required PaginationParams paginationParams,
  }) async {
    final loadParams = readStateOrNull()?.loadParams ?? initialLoadParams;
    final paginatedList = await fetchItems(loadParams, paginationParams);
    return (paginatedList.totalCount, paginatedList.results);
  }

  void markResetToZero() {
    _mustResetToZeroPage = true;
  }

  int? _getMaxClosedPage() {
    final state = stateOrNull;
    return state?.maxFrom(state.currentPage);
  }

  Future<void> loadPage(
    int page, {
    PaginationUpdateType updateType = PaginationUpdateType.autoUpdateCache,
  }) async {
    final oldState = stateOrNull;
    if (oldState != null) {
      if (updateType == PaginationUpdateType.nonUpdateCache) {
        final pageState = oldState.pageItems[page];

        if (pageState != null && pageState.error == null) {
          return;
        }
      }

      if (updateType == PaginationUpdateType.clearOthers) {
        cancelAllLoads();
        changeState(
          oldState.copyWith(
            pageItems: const {},
          ),
        );
      }

      changeState(
        oldState.copyWith(
          currentPage: page,
        ),
      );
    }

    try {
      final response = await _initiatePageLoading(
        page,
        updateType: updateType,
      );
      final currentPageItems = {...state.pageItems};
      currentPageItems[page] = response.page;
      final totalCountChanged =
          state.totalCount == 0
              ? false
              : response.totalCount != state.totalCount;
      if (totalCountChanged) {
        _onTotalCountChanged(response.totalCount);
      } else {
        changeState(
          state.copyWith(
            totalCount: response.totalCount,
            pageItems: currentPageItems,
          ),
        );
        log('page $page updated');
      }
    } catch (e) {
      switch (e) {
        case PaginationCancelException _:
          break;
        default:
          final currentPageItems = {...state.pageItems};
          currentPageItems[page] =
              currentPageItems[page]?.copyWith(
                error: e,
                isLoading: false,
              ) ??
              PaginationPageState(
                error: e,
                isLoading: false,
              );
          changeState(
            state.copyWith(
              pageItems: currentPageItems,
            ),
          );
      }
    }
  }

  Future<PaginationPageResponse<T>> _initiatePageLoading(
    int page, {
    required PaginationUpdateType updateType,
  }) async {
    final existCompleter = _pageCompleters[page];
    if (existCompleter != null && !existCompleter.isCompleted) {
      return existCompleter.future;
    } else {
      final completer = Completer<PaginationPageResponse<T>>();

      void syncCancel() {
        if (_pageCompleters[page] != completer) {
          throw PaginationCancelException();
        }
      }

      try {
        _pageCompleters[page] = completer;
        _increasePageUpdateCount(page);
        final countItems = await loadCountItems(
          paginationParams: PaginationParams.fromPage(
            limit: stateOrNull?.limit ?? initialLimit,
            page: page,
          ),
        );

        syncCancel();
        final updateCount = _getPageUpdateCount(page);
        final pageState = PaginationPageState<T>(
          isLoading: false,
          items: countItems.$2,
          updateCount: updateCount,
        );

        final pageResponse = PaginationPageResponse(
          page: pageState,
          totalCount: countItems.$1,
        );

        completer.complete(pageResponse);
        return pageResponse;
      } catch (e, stk) {
        syncCancel();
        completer.completeError(e, stk);
        rethrow;
      }
    }
  }

  int _getPageUpdateCount(int page) {
    return _pageUpdateCount[page] ?? 0;
  }

  void _increasePageUpdateCount(int page) {
    _pageUpdateCount[page] = (_pageUpdateCount[page] ?? 0) + 1;
  }

  void stopThrottler() {
    _throttler?.cancel();
    _throttler = null;
  }

  @protected
  PaginationState<T, Z, Y> initiateBuild() {
    ref.onDispose(
      () {
        stopThrottler();
        _frameCompleter = null;
        cancelAllLoads();
        _refreshing = true;
      },
    );
    final state = stateOrNull;
    final page = _mustResetToZeroPage ? 0 : _getMaxClosedPage();
    var resetTimes = state?.resetTimes ?? 0;
    if (_mustResetToZeroPage) {
      _mustResetToZeroPage = false;
      resetTimes++;
    }

    if (autoStart || page != null) {
      loadPage(page ?? initialPage).whenComplete(
        () {
          _refreshing = false;
        },
      );
    }

    return PaginationState(
      resetTimes: resetTimes,
      items: PaginationState.fromPageItems({}),
      currentPage: state?.currentPage ?? initialPage,
      limit: state?.limit ?? initialLimit,
      loadParams: state?.loadParams ?? initialLoadParams,
      totalCount: state?.totalCount ?? 0,
      pageItems: {},
    );
  }
}

abstract class AutoDisposePaginationNotifier<T, Z, Y>
    extends AutoDisposeNotifier<PaginationState<T, Z, Y>>
    with PaginationNotifierMixin<T, Z, Y> {
  @override
  PaginationState<T, Z, Y> readState() => super.state;

  @override
  PaginationState<T, Z, Y>? readStateOrNull() => super.stateOrNull;

  @override
  Ref<PaginationState<T, Z, Y>> readRefence() => super.ref;

  @override
  Y? readArgs() => null;

  @override
  void changeState(PaginationState<T, Z, Y> newState) {
    super.state = newState;
  }

  @override
  PaginationState<T, Z, Y> build() {
    return initiateBuild();
  }
}

class ExamplePaginationNotifier
    extends AutoDisposePaginationNotifier<List<int>, int, Null> {
  @override
  int get initialLoadParams => 10;

  @override
  Future<PaginatedListResponse<List<int>>> fetchItems(
    int loadParams,
    PaginationParams paginationParams,
  ) {
    throw UnimplementedError();
  }
}
