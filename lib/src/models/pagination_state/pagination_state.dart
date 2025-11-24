import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_pagination_provider/src/models/error_stacktrace/error_stacktrace.dart';
import 'package:riverpod_pagination_provider/src/models/pagination_page_state/pagination_page_state.dart';
import 'package:riverpod_pagination_provider/src/models/pagination_status/pagination_status.dart';
import 'package:riverpod_pagination_provider/src/utils/pagination_helpers.dart';

part 'pagination_state.freezed.dart';

@Freezed(
  fromJson: false,
  toJson: false,
  genericArgumentFactories: true,
  addImplicitFinal: true,
  makeCollectionsUnmodifiable: true,
)
abstract class PaginationState<T, Z, Y> with _$PaginationState<T, Z, Y> {
  const PaginationState._();

  const factory PaginationState({
    required Map<int, PaginationPageState<T>> pageItems,
    required List<T> items,
    required List<T?> mixedItems,
    required Z loadParams,
    Y? extraArgs,
    required int totalCount,
    required int limit,
    required int initialPage,
    @Default(0) int currentPage,
    @Default(0) int resetTimes,
    required bool initialLoading,
    required bool initialLoaded,
    required bool refreshing,
    ErrorStackTrace? initialError,
  }) = _PaginationState<T, Z, Y>;

  factory PaginationState.fromItems({
    required List<T> items,
    required Z loadParams,
  }) {
    return PaginationState(
      pageItems: {
        0: PaginationPageState(
          items: [...items],
          isLoading: false,
          updateCount: 0,
          errorStackTrace: null,
        ),
      },
      items: [...items],
      mixedItems: [...items],
      loadParams: loadParams,
      totalCount: items.length,
      limit: items.length,
      initialPage: 0,
      initialLoading: false,
      initialLoaded: true,
      refreshing: false,
    );
  }

  static ({List<T> items, List<T?> mixedItems}) extractItems<T>(
    PaginationState<T, dynamic, dynamic> state, {
    bool onlyOrdered = true,
  }) {
    final items = <T>[];
    final mixedTemp = <T?>[];
    bool stopAddingItems = false;
    final totalCount = state.totalCount;
    if (totalCount == 0) {
      return (items: [], mixedItems: []);
    }

    for (var i = 0; i < totalCount; i++) {
      final item = state.itemByIndex(i);
      if (item == null && onlyOrdered && !stopAddingItems) {
        stopAddingItems = true;
      }
      if (!stopAddingItems && item != null) {
        items.add(item);
      }
      mixedTemp.add(item);
    }

    return (items: items, mixedItems: mixedTemp);
  }

  PaginationStatus get status {
    return when(
      loading: () {
        return PaginationStatus.loadingBeforeData();
      },
      error: (error, stackTrace) {
        return PaginationStatus.errorBeforeData();
      },
      data: (state) {
        return PaginationStatus.errorBeforeData();
      },
    );
  }

  int get cachedItemsCount {
    var temp = 0;
    for (final entry in pageItems.entries) {
      temp += entry.value.items.length;
    }
    return temp;
  }

  Set<int> get loadedPages {
    final temp =
        pageItems.keys.toList()..sort(
          (a, b) => a.compareTo(b),
        );
    return temp.toSet();
  }

  List<int> get pages {
    final temp = <int>[];
    var page = 0;
    while (canPageExist(page)) {
      temp.add(page);
      page++;
    }
    return temp;
  }

  int get maxPages => (totalCount / limit).ceil();

  bool canPageExist(int page) {
    if (page < 0) {
      return false;
    }
    return page < maxPages;
  }

  int maxFrom(int page) {
    final max = maxPages - 1;
    const min = 0;
    for (var i = max; i >= min; i--) {
      if (page == i) {
        return i;
      }
    }
    return 0;
  }

  List<T> get orderedItems {
    return extractItems(this, onlyOrdered: false).items;
  }

  PaginationPageState<T> getPageState(int page) {
    return pageItems[page] ?? PaginationPageState();
  }

  T? itemByIndex(int index) {
    try {
      final relativeIndex = PaginationHelpers.getRelativeIndex(
        index,
        totalCount,
        limit,
      );
      return pageItems[relativeIndex.page]?.items[relativeIndex.relativeIndex];
    } catch (e) {
      return null;
    }
  }

  bool get isNotEmpty {
    return refreshing ? true : totalCount != 0;
  }

  bool get isEmpty {
    return !isNotEmpty;
  }

  bool get canShow {
    return when(
      loading: () {
        return true;
      },
      error: (error, stackTrace) {
        return false;
      },
      data: (state) {
        return state.isNotEmpty;
      },
    );
  }

  InfiniteValue listenInfinite<InfiniteValue>({
    InfiniteValue Function(ErrorStackTrace errorStacktrace)? error,
    InfiniteValue Function(PaginationState<T, Z, Y> data)? empty,
    required InfiniteValue Function(
      PaginationState<T, Z, Y> data,
      int totalCount,
      int resetTimes,
      T? Function(int index) itemByIndex,
    )
    data,
  }) {
    InfiniteValue callData() {
      return data(this, totalCount, resetTimes, this.itemByIndex);
    }

    return listen(
      (isLoading, errorStacktrace, state) {
        if (errorStacktrace != null) {
          return error?.call(errorStacktrace) ?? callData();
        } else {
          final isEmpty = !isLoading && state.isEmpty;
          return isEmpty ? empty?.call(this) ?? callData() : callData();
        }
      },
    );
  }

  ListenValue listen<ListenValue>(
    ListenValue Function(
      bool isLoading,
      ErrorStackTrace? errorStacktrace,
      PaginationState<T, Z, Y> data,
    )
    callback,
  ) {
    return when(
      loading: () {
        return callback(true, null, this);
      },
      error: (error, stackTrace) {
        return callback(
          false,
          ErrorStackTrace(error: error, stackTrace: stackTrace),
          this,
        );
      },
      data: (state) {
        return callback(false, null, this);
      },
    );
  }

  WhenValue when<WhenValue>({
    required WhenValue Function() loading,
    required WhenValue Function(Object error, StackTrace stackTrace) error,
    required WhenValue Function(PaginationState<T, Z, Y> state) data,
    WhenValue Function(PaginationState<T, Z, Y> state)? empty,
  }) {
    final errorStackTrace = initialError;
    final isEmpty = this.isEmpty;
    return initialLoading
        ? loading()
        : errorStackTrace != null
        ? error(errorStackTrace.error, errorStackTrace.stackTrace)
        : isEmpty
        ? empty?.call(this) ?? data(this)
        : data(this);
  }

  WhenValue? whenOrNull<WhenValue>({
    WhenValue? Function()? loading,
    WhenValue? Function(Object error, StackTrace stackTrace)? error,
    WhenValue Function(PaginationState<T, Z, Y> state)? empty,
    WhenValue? Function(PaginationState<T, Z, Y> state)? data,
  }) {
    final errorStackTrace = initialError;
    return initialLoading
        ? loading?.call()
        : errorStackTrace != null
        ? error?.call(errorStackTrace.error, errorStackTrace.stackTrace)
        : isEmpty
        ? empty?.call(this) ?? data?.call(this)
        : data?.call(this);
  }
}
