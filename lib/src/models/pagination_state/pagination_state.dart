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
abstract class PaginationState<Item, LoadState, Arg>
    with _$PaginationState<Item, LoadState, Arg> {
  const PaginationState._();

  const factory PaginationState({
    required Map<int, PaginationPageState<Item>> pageItems,
    required List<Item> items,
    required List<Item?> mixedItems,
    required LoadState loadParams,
    Arg? extraArgs,
    required int totalCount,
    required int limit,
    required int initialPage,
    @Default(0) int currentPage,
    @Default(0) int resetTimes,
    required bool initialLoading,
    required bool initialLoaded,
    required bool refreshing,
    required bool cachedBeforeRefresh,
    ErrorStackTrace? initialError,
  }) = _PaginationState<Item, LoadState, Arg>;

  factory PaginationState.fromItems({
    required List<Item> items,
    required LoadState loadParams,
  }) {
    return PaginationState(
      cachedBeforeRefresh: false,
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

  static ({List<Item> items, List<Item?> mixedItems}) extractItems<Item>(
    PaginationState<Item, dynamic, dynamic> state, {
    bool onlyOrdered = true,
  }) {
    final items = <Item>[];
    final mixedTemp = <Item?>[];
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

  PaginationState<Item, LoadState, Arg> get nonCachedState {
    return cachedBeforeRefresh
        ? copyWith(
            items: [],
            mixedItems: [],
            pageItems: {},
          )
        : this;
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

  bool get hasMore {
    return items.length != totalCount;
  }

  Set<int> get loadedPages {
    final temp = pageItems.keys.toList()
      ..sort(
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

  List<Item> get orderedItems {
    return extractItems(this, onlyOrdered: false).items;
  }

  PaginationPageState<Item> getPageState(int page) {
    return pageItems[page] ?? PaginationPageState();
  }

  Item? itemByIndex(
    int index, {
    bool showCache = true,
  }) {
    if (cachedBeforeRefresh && !showCache) {
      return null;
    }
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
    bool showCacheOnRefresh = false,
    bool skipInitialLoading = false,
    InfiniteValue Function()? loading,
    int? defaultLoadingCount,
    required InfiniteValue Function(ErrorStackTrace errorStacktrace)? error,
    required InfiniteValue Function(PaginationState<Item, LoadState, Arg> data)?
        empty,
    required InfiniteValue Function(
      PaginationState<Item, LoadState, Arg> data,
      int totalCount,
      int resetTimes,
      Item? Function(int index) itemByIndex,
    ) data,
  }) {
    final initialError = this.initialError;
    final state = showCacheOnRefresh ? this : nonCachedState;
    final isEmpty = this.isEmpty;
    if (loading != null && initialLoading && !skipInitialLoading) {
      return loading();
    } else if (initialError != null && error != null) {
      return error(initialError);
    } else if (isEmpty && empty != null) {
      return empty(state);
    } else {
      final showDefaultCounts = initialLoading ? true : refreshing;
      return data(
        state,
        showDefaultCounts
            ? (defaultLoadingCount ?? state.totalCount)
            : state.totalCount,
        state.resetTimes,
        state.itemByIndex,
      );
    }
  }

  ListenValue listen<ListenValue>(
    ListenValue Function(
      bool initialLoading,
      ErrorStackTrace? errorStacktrace,
      PaginationState<Item, LoadState, Arg> data,
    ) callback, {
    bool skipRefreshing = true,
    bool showCacheOnRefresh = false,
  }) {
    final state = showCacheOnRefresh ? this : nonCachedState;
    return callback(
      state.initialLoading,
      state.initialError,
      state,
    );
  }

  WhenValue when<WhenValue>({
    required WhenValue Function() loading,
    required WhenValue Function(Object error, StackTrace stackTrace) error,
    required WhenValue Function(PaginationState<Item, LoadState, Arg> state)
        data,
    WhenValue Function(PaginationState<Item, LoadState, Arg> state)? empty,
    bool skipRefreshing = false,
    bool showCacheOnRefresh = false,
    bool skipInitialLoading = false,
  }) {
    final cachedBeforeRefresh = this.cachedBeforeRefresh;
    final initialLoading = this.initialLoading;
    final refreshing = !initialLoading && this.refreshing;
    final errorStackTrace = initialError;
    final isEmpty = this.isEmpty;
    return cachedBeforeRefresh && showCacheOnRefresh
        ? data(this)
        : !skipInitialLoading && initialLoading
            ? loading()
            : !skipRefreshing && refreshing
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
    WhenValue Function(PaginationState<Item, LoadState, Arg> state)? empty,
    WhenValue? Function(PaginationState<Item, LoadState, Arg> state)? data,
    bool skipRefreshing = false,
    bool showCacheOnRefresh = false,
    bool skipInitialLoading = false,
  }) {
    return when(
      skipInitialLoading: skipInitialLoading,
      showCacheOnRefresh: showCacheOnRefresh,
      skipRefreshing: skipRefreshing,
      loading: () {
        return loading?.call();
      },
      error: (e, stackTrace) {
        return error?.call(e, stackTrace);
      },
      empty: (state) => empty?.call(state),
      data: (state) {
        return data?.call(state);
      },
    );
  }
}
