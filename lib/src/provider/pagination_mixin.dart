part of 'pagination_provider.dart';

mixin PaginationNotifierMixin<T, Z, Y>
    implements PaginationNotifierHelper<T, Z, Y> {
  late final CustomLogger _logger = CustomLogger(
    owner: debugLabel ?? 'PaginationProvider',
  );

  final Map<int, FlexibleCompleter<PaginationPageResponse<T>>> _pageCompleters =
      {};

  final Map<int, int> _pageUpdateCount = {};

  final SafeExecutor _frameUpdater = SafeExecutor();

  bool _mustResetToZeroPage = false;

  bool _refreshing = false;

  String? get debugLabel => null;

  bool get watchErrors => false;

  bool get autoStart => true;

  int get initialLimit => 10;

  int get initialPage => 0;

  final ThrottleExecutor _refreshExecutor = ThrottleExecutor();

  Duration get throttleDuration => const Duration(milliseconds: 400);

  Future<PaginatedListResponse<T>> fetchItems(
    Z loadParams,
    Y? arg,
    PaginationParams paginationParams,
  );

  void log(Object object) {
    _logger.log(object);
  }

  void updateState(PaginationState<T, Z, Y> paginationState) {
    changeState(_valueTransformer(paginationState));
  }

  void _onTotalCountChanged(int totalCount) {
    updateState(
      state.copyWith(
        totalCount: totalCount,
        pageItems: {},
      ),
    );
    refresh();
  }

  void reset({bool schedule = false}) {
    _refreshExecutor.execute(
      duration: schedule ? throttleDuration : Duration.zero,
      onAction: () {
        markResetToZero();
        refresh();
      },
    );
  }

  void refresh() {
    ref.invalidateSelf();
  }

  void _closeScheduledTasks() {
    _closeScheduledPageTasks();
    _refreshExecutor.stop();
    _frameUpdater.cancel();
  }

  void _closeScheduledPageTasks() {
    _pageCompleters.clear();
  }

  void previousPage() {
    final previousPage = state.currentPage - 1;
    final canExist = state.canPageExist(previousPage);
    if (canExist) {
      loadPage(previousPage);
    }
  }

  void nextPage() {
    final nextPage = state.currentPage + 1;
    final canExist = state.canPageExist(nextPage);
    if (canExist) {
      loadPage(nextPage);
    }
  }

  void changeLimit(int limit) {
    if (limit <= 0) {
      limit = 1;
    }
    if (limit != state.limit) {
      changeState(
        state.copyWith(
          limit: limit,
        ),
      );
      refresh();
    }
  }

  void changeLoadParams(
    Z Function(Z current) onChange, {
    bool throttle = true,
  }) {
    final newParams = onChange(state.loadParams);
    if (state.loadParams != newParams) {
      updateState(
        state.copyWith(
          loadParams: newParams,
        ),
      );
      reset(schedule: throttle);
    }
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
    _frameUpdater.cancel();
    _frameUpdater.perform(
      () {
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
          updateState(
            state.copyWith(
              currentPage: page,
            ),
          );
        }
      },
    );
  }

  PaginationState<T, Z, Y> _valueTransformer(PaginationState<T, Z, Y> value) {
    return value.copyWith(
      items: PaginationState.fromPageItems(
        {...value.pageItems},
      ),
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

  Future<PaginatedListResponse<T>> loadCountItems({
    required PaginationParams paginationParams,
  }) async {
    final loadParams = readStateOrNull()?.loadParams ?? initialLoadParams;
    final arg = readArgs();
    final paginatedList = await fetchItems(loadParams, arg, paginationParams);
    return paginatedList;
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
        _closeScheduledPageTasks();
        updateState(
          oldState.copyWith(
            pageItems: const {},
          ),
        );
      }

      updateState(
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
      if (response == null) {
        return;
      }
      final currentPageItems = {...state.pageItems};
      currentPageItems[page] = response.page;
      final totalCountChanged =
          state.totalCount == 0
              ? false
              : response.totalCount != state.totalCount;
      if (totalCountChanged) {
        _onTotalCountChanged(response.totalCount);
      } else {
        updateState(
          state.copyWith(
            totalCount: response.totalCount,
            pageItems: currentPageItems,
          ),
        );
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
          updateState(
            state.copyWith(
              pageItems: currentPageItems,
            ),
          );
      }
    }
  }

  Future<void> _loadInitialPage(int? page) async {
    if (autoStart || page != null) {
      try {
        await loadPage(page ?? initialPage);
      } finally {
        _refreshing = false;
      }
    }
  }

  Future<PaginationPageResponse<T>?> _initiatePageLoading(
    int page, {
    required PaginationUpdateType updateType,
  }) async {
    final existCompleter = _pageCompleters[page];
    if (existCompleter != null && !existCompleter.isCompleted) {
      return existCompleter.future;
    } else {
      final completer = FlexibleCompleter<PaginationPageResponse<T>>();

      bool isSync() {
        return completer.canPerformAction(_pageCompleters[page]);
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
        if (isSync()) {
          final updateCount = _getPageUpdateCount(page);
          final pageState = PaginationPageState<T>(
            isLoading: false,
            items: countItems.results,
            updateCount: updateCount,
          );

          final pageResponse = PaginationPageResponse(
            page: pageState,
            totalCount: countItems.totalCount,
          );

          completer.complete(pageResponse);
          return pageResponse;
        } else {
          return null;
        }
      } catch (e, stk) {
        if (isSync()) {
          completer.completeError(e, stk);
          rethrow;
        }
        return null;
      }
    }
  }

  int _getPageUpdateCount(int page) {
    return _pageUpdateCount[page] ?? 0;
  }

  void _increasePageUpdateCount(int page) {
    _pageUpdateCount[page] = (_pageUpdateCount[page] ?? 0) + 1;
  }

  @protected
  PaginationState<T, Z, Y> initiateBuild() {
    ref.onDispose(
      () {
        _closeScheduledTasks();
        _refreshing = true;
      },
    );
    final state = stateOrNull;
    final page = _mustResetToZeroPage ? 0 : _getMaxClosedPage();
    var resetTimes = state?.resetTimes ?? 0;
    if (_mustResetToZeroPage) {
      _mustResetToZeroPage = false;
      _pageUpdateCount.clear();
      resetTimes++;
    }
    _loadInitialPage(page);
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
