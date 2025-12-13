part of 'pagination_provider.dart';

enum PaginationResetType {
  refresh,
  force,
  reloadAll,
  none,
}

mixin PaginationNotifierMixin<T, Z, Y>
    implements PaginationNotifierHelper<T, Z, Y> {
  late final CustomLogger _logger = CustomLogger(
    owner: debugLabel ?? 'PaginationProvider',
  );

  /// key is Page, value is fetch progress of this page
  final Map<int, FlexibleCompleter<PaginationPageResponse<T>>> _pageCompleters =
      {};

  /// Key is page, value is how many times page has been updated
  final Map<int, int> _pageUpdateCount = {};

  /// Visible indexes during build
  final Set<int> _visibleIndexes = {};

  /// Controls the process of invalidating provider
  FlexibleCompleter _refreshCompleter = FlexibleCompleter();

  /// Collecting items during build
  final SafeExecutor _frameUpdater = SafeExecutor();

  /// Helps with throttle refreshing provider
  final ThrottleExecutor _refreshThrottler = ThrottleExecutor();

  Duration get throttleDuration => const Duration(milliseconds: 400);

  /// IF set this value to true invalidating provider leads to load from first page and also resetTimes will be updated
  bool _mustResetToZeroPage = false;

  /// IF set this value to `true` invalidating provider will lead to load previous pages
  bool _mustReloadPreviousPages = false;

  /// Debug label for logger
  String? get debugLabel => null;

  /// IF set to true watchPage will reexecute process of fetching page if error occurs
  bool get watchErrors => false;

  /// IF set to true provider will load initial page from start
  bool get autoStart => true;

  /// With this option its available to change page with loading processing
  /// Default behavious is that u using onItemBuild and it will do it by its own
  bool changePageOnLoadRequest = false;

  /// Currently onItemBuild will obtain current page by index automatically
  /// This is need load initial page from provider restart
  bool changePageOnItemBuild = true;

  int get initialLimit => 10;

  int get initialPage => 0;

  bool _initialLoaded = false;

  bool get initialLoaded => _initialLoaded;

  bool get useThrottler => true;

  bool get useCacheOnReload => true;

  bool get alwaysReloadPages => false;

  PaginationResetType get resetOnLoadParamsChanged => PaginationResetType.force;

  PaginationResetType get defaultResetType => PaginationResetType.force;

  PaginationPageUpdateType get pageUpdateType =>
      PaginationPageUpdateType.autoUpdateCache;

  Future<PaginatedListResponse<T>> fetchItems(
    Z loadParams,
    Y? arg,
    PaginationParams paginationParams,
  );

  void _log(Object object) {
    _logger.log(object);
  }

  void updateState(PaginationState<T, Z, Y> paginationState) {
    if (hasState) {
      changeState(_valueTransformer(paginationState));
    } else {
      _log('update state skipped due to provider rebuilding');
    }
  }

  void findAndRemoveItem(
    bool Function(T item) checker,
  ) {
    return findAndUpdateItem(
      checker,
      resolveUpdate: (item) {
        return null;
      },
    );
  }

  void findAndUpdateItem(
    bool Function(T item) checker, {
    required T? Function(T item) resolveUpdate,
    bool multiple = false,
  }) {
    // final limit = state.limit;
    final pageItems = {...state.pageItems};
    for (var pageIndex = 0; pageIndex < pageItems.length; pageIndex++) {
      final pageEntry = pageItems.entries.elementAt(pageIndex);
      final pageState = pageEntry.value;
      final pageKey = pageEntry.key;
      final items = [...pageState.items];
      var complete = false;
      var found = false;
      for (var itemIndex = 0; itemIndex < items.length; itemIndex++) {
        final item = items[itemIndex];
        final hasFound = checker(item);
        if (hasFound) {
          if (!multiple) {
            complete = true;
          }
          found = true;
          final updatedItem = resolveUpdate(item);
          if (updatedItem == null) {
            pageItems[pageKey] = pageState.copyWith(
              items: items..removeAt(itemIndex),
            );

            /// TODO: if some item was deleted that totalCount must be changed
            /// page next items must be swapped by one looking to current `state.limit`
            /// and also page index must be swapped by -1 because items has been switched
          } else {
            pageItems[pageKey] = pageState.copyWith(
              items:
                  items
                    ..removeAt(itemIndex)
                    ..insert(itemIndex, updatedItem),
            );
          }
          if (complete) {
            break;
          }
        }
      }
      if (found) {
        updateState(
          state.copyWith(
            pageItems: pageItems,
          ),
        );
      }
      if (complete) {
        break;
      }
    }
  }

  void _onTotalCountChanged(
    int totalCount,
  ) {
    _log('total count changed: $totalCount');
    updateState(
      state.copyWith(
        totalCount: totalCount,
        pageItems: {},
      ),
    );
    reset(resetType: PaginationResetType.force);
  }

  void refresh() {
    reset();
  }

  void reset({
    bool schedule = false,
    PaginationResetType? resetType,
  }) {
    final resultResetType = resetType ?? defaultResetType;
    void action() {
      switch (resultResetType) {
        case PaginationResetType.reloadAll:
          markReloadAllPages();
          ref.invalidateSelf();
        case PaginationResetType.force:
          markResetToZero();
          ref.invalidateSelf();
          break;
        case PaginationResetType.refresh:
          ref.invalidateSelf();
          break;
        case PaginationResetType.none:
          break;
      }
    }

    switch (resultResetType) {
      case PaginationResetType.none:
        action();
      default:
        _refreshThrottler.execute(
          duration: schedule ? throttleDuration : Duration.zero,
          onAction: action,
        );
    }
  }

  void _closeScheduledTasks() {
    _pageCompleters.clear();
    _refreshCompleter.cancel();
    _visibleIndexes.clear();
    _refreshThrottler.stop();
    _frameUpdater.cancel();
  }

  void _clearAndReset() {
    _closeScheduledTasks();
    if (alwaysReloadPages) {
      markReloadAllPages();
    }
    _refreshCompleter = FlexibleCompleter();
  }

  bool loadNext() {
    final pages = state.loadedPages;
    final lastPage = pages.lastOrNull;
    if (lastPage == null) {
      return false;
    }
    final nextPage = lastPage + 1;
    if (state.canPageExist(nextPage)) {
      loadPage(nextPage);
      return true;
    } else {
      return false;
    }
  }

  bool switchPreviousPage({
    PaginationPageUpdateType? updateType,
  }) {
    final previousPage = state.currentPage - 1;
    final canExist = state.canPageExist(previousPage);

    if (canExist) {
      loadPage(
        previousPage,
        changePage: true,
        updateType: updateType,
      );
      return true;
    } else {
      return false;
    }
  }

  bool switchNextPage({
    PaginationPageUpdateType? updateType,
  }) {
    final nextPage = state.currentPage + 1;
    final canExist = state.canPageExist(nextPage);
    if (canExist) {
      loadPage(
        nextPage,
        changePage: true,
        updateType: pageUpdateType,
      );
      return true;
    } else {
      return false;
    }
  }

  void changeLimit(
    int limit, {
    bool? throttle,
    PaginationResetType resetType = PaginationResetType.refresh,
  }) {
    final useThrottler = throttle ?? this.useThrottler;
    if (limit <= 0) {
      limit = 1;
    }
    if (limit != state.limit) {
      updateState(
        state.copyWith(
          limit: limit,
        ),
      );

      reset(
        resetType: resetType,
        schedule: useThrottler,
      );
    }
  }

  void updateLoadParams(
    Z Function(Z current) onChange, {
    bool? throttle = false,
  }) {
    changeLoadParams(
      resetType: PaginationResetType.none,
      throttle: throttle,
      onChange,
    );
  }

  void changeLoadParams(
    Z Function(Z current) onChange, {
    bool? throttle,
    PaginationResetType? resetType,
  }) {
    final useThrottler = throttle ?? this.useThrottler;
    final resultResetType = resetType ?? resetOnLoadParamsChanged;
    final newParams = onChange(state.loadParams);
    if (state.loadParams != newParams) {
      updateState(
        state.copyWith(
          loadParams: newParams,
        ),
      );
      reset(
        resetType: resultResetType,
        schedule: useThrottler,
      );
    }
  }

  PaginationRelativeIndex _getRelativeIndex(int index) {
    return PaginationHelpers.getRelativeIndex(
      index,
      state.totalCount,
      state.limit,
    );
  }

  void _onIndexFetch(PaginationRelativeIndex relativeIndex) {
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
  }

  void onItemBuild(int index) {
    final skip = !hasState || refreshing;
    if (skip) {
      return;
    }
    _visibleIndexes.add(index);
    _frameUpdater.cancel();
    _frameUpdater.perform(
      () {
        final visible = {..._visibleIndexes};
        _visibleIndexes.clear();
        _onVisibleIndexesChanges(visible);
      },
    );
  }

  void _onVisibleIndexesChanges(Set<int> visible) {
    final sortedVisible = visible.toList()..sort();

    for (final index in sortedVisible) {
      _onIndexFetch(
        _getRelativeIndex(index),
      );
    }

    final Map<int, List<PaginationRelativeIndex>> visiblePageIndexMap = {};

    for (final index in sortedVisible) {
      final relativeIndex = _getRelativeIndex(index);
      visiblePageIndexMap.update(
        relativeIndex.page,
        (value) {
          return [...value, relativeIndex];
        },
        ifAbsent: () {
          return [relativeIndex];
        },
      );
    }

    final lastPage = visiblePageIndexMap.entries.lastOrNull?.key;
    if (lastPage != null) {
      updateState(
        state.copyWith(currentPage: lastPage),
      );
    }
  }

  PaginationState<T, Z, Y> _valueTransformer(PaginationState<T, Z, Y> value) {
    final extracted = PaginationState.extractItems(value);
    return value.copyWith(
      items: extracted.items,
      mixedItems: extracted.mixedItems,
    );
  }

  bool get refreshing {
    return !_refreshCompleter.isCompleted;
  }

  bool get initialLoading {
    return refreshing && !_initialLoaded;
  }

  bool get hasState {
    return stateOrNull != null;
  }

  bool watchPage(int page) {
    final canExist = state.canPageExist(page);
    if (refreshing || !hasState || !canExist) {
      return false;
    }
    final pageCompleter = _pageCompleters[page];
    final pageState = state.getPageState(page);
    final hasError = pageState.hasError;
    if (pageCompleter == null || (pageCompleter.isCompleted && hasError)) {
      if (hasError) {
        if (watchErrors) {
          unawaited(loadPage(page));
          return true;
        }
      } else {
        unawaited(loadPage(page));
        return true;
      }
    }
    return false;
  }

  Future<PaginatedListResponse<T>> loadCountItems({
    required PaginationParams paginationParams,
  }) async {
    final loadParams = readStateOrNull()?.loadParams ?? initialLoadParams;
    final arg = readArgs();
    return Future.delayed(
      Duration.zero,
      () {
        return fetchItems(loadParams, arg, paginationParams);
      },
    );
  }

  void onPageUpdated({
    required int page,
    required PaginationPageResponse<T> pageResponse,
    required bool wasRefreshing,
  }) {}

  void markResetToZero() {
    _mustResetToZeroPage = true;
  }

  void markReloadAllPages() {
    _mustReloadPreviousPages = true;
  }

  int? _getMaxClosedPage() {
    final state = stateOrNull;
    return state?.maxFrom(state.currentPage);
  }

  void _changePage(int page) {
    updateState(state.copyWith(currentPage: page));
  }

  Future<void> loadPage(
    int page, {
    bool? changePage,
    PaginationPageUpdateType? updateType,
  }) async {
    final pageUpdateType = updateType ?? this.pageUpdateType;
    final oldState = stateOrNull;
    if (oldState != null) {
      if (pageUpdateType == PaginationPageUpdateType.nonUpdateCache) {
        final pageState = oldState.pageItems[page];

        if (pageState != null && !pageState.hasError) {
          return;
        }
      }
      final autoChangePage = changePage ?? changePageOnLoadRequest;
      if (autoChangePage) {
        _changePage(page);
      }

      if (pageUpdateType == PaginationPageUpdateType.clearOthers) {
        _clearAndReset();
        updateState(
          oldState.copyWith(
            pageItems: const {},
          ),
        );
      }
    }

    final refreshCompleter = _refreshCompleter;

    void onCompleteRefresh({bool success = false}) {
      if (refreshCompleter.canPerformAction(_refreshCompleter)) {
        refreshCompleter.complete();
        _onRefreshComplete(success: success);
      }
    }

    try {
      final response = await _initiatePageLoading(
        page,
      );
      if (response == null) {
        return;
      }
      final currentPageItems = {if (!refreshing) ...state.pageItems};
      currentPageItems[page] = response.page;
      final totalCountChanged =
          state.totalCount == 0
              ? false
              : response.totalCount != state.totalCount;

      if (totalCountChanged && !refreshing) {
        _onTotalCountChanged(response.totalCount);
      } else {
        updateState(
          state.copyWith(
            totalCount: response.totalCount,
            pageItems: currentPageItems,
          ),
        );
        onPageUpdated(
          page: page,
          pageResponse: response,
          wasRefreshing: refreshing,
        );
        onCompleteRefresh(success: true);
        _log('page updated: $page');
      }
    } catch (e, stk) {
      switch (e) {
        case PaginationCancelException _:
          break;
        default:
          final setInitialError = refreshCompleter.canPerformAction(
            _refreshCompleter,
          );
          final errorStackTrace = ErrorStackTrace(error: e, stackTrace: stk);
          final currentPageItems = {...state.pageItems};
          currentPageItems[page] =
              currentPageItems[page]?.copyWith(
                errorStackTrace: errorStackTrace,
                isLoading: false,
              ) ??
              PaginationPageState(
                errorStackTrace: errorStackTrace,
                isLoading: false,
              );

          updateState(
            state.copyWith(
              pageItems: currentPageItems,
              initialError:
                  setInitialError
                      ? ErrorStackTrace(error: e, stackTrace: stk)
                      : state.initialError,
            ),
          );
          onCompleteRefresh();
      }
    }
  }

  void _onRefreshComplete({required bool success}) {
    if (success) {
      _initialLoaded = true;
      afterRefresh();
    }
    updateState(
      state.copyWith(
        cachedBeforeRefresh: false,
        initialLoading: initialLoading,
        initialLoaded: initialLoaded,
        refreshing: refreshing,
      ),
    );
  }

  Future<void> loadToMax(int maxPage) async {
    if (maxPage == 0) {
      return;
    }
    final refreshCompleter = _refreshCompleter;

    void onCompleteRefresh({bool success = false}) {
      if (refreshCompleter.canPerformAction(_refreshCompleter)) {
        refreshCompleter.complete();
        _onRefreshComplete(success: success);
      }
    }

    final response = await _loadBatch(maxPage);

    if (!response.cancelled) {
      final setInitialError = refreshCompleter.canPerformAction(
        _refreshCompleter,
      );
      final errorOccured = response.errorStacktrace != null;
      final pageStates = response.pageStates(_getPageUpdateCount);
      updateState(
        state.copyWith(
          initialError:
              setInitialError ? response.errorStacktrace : state.initialError,
          totalCount: response.totalCount,
          pageItems: {
            if (!refreshing) ...state.pageItems,
            ...pageStates,
          },
        ),
      );
      if (errorOccured) {
        _log('batch update failed: ${pageStates.keys.join(', ')}');
      } else {
        _log('batch update complete: ${pageStates.keys.join(', ')}');
      }
      onCompleteRefresh(success: !errorOccured);
    }
  }

  Future<PaginationBatchResponse<T>> _loadBatch(
    int maxPage,
  ) async {
    var totalCount = 0;
    final temp = <int, List<T>>{};
    final oldState = stateOrNull;
    final limit = oldState?.limit ?? initialLimit;
    final pages = Iterable.generate(
      maxPage,
      (index) {
        return index;
      },
    );

    final completers = Map.fromEntries(
      pages.map(
        (page) {
          _increasePageUpdateCount(page);
          return MapEntry(
            page,
            FlexibleCompleter<PaginationPageResponse<T>>(),
          );
        },
      ),
    );
    _pageCompleters.addAll({...completers});
    bool isSync() {
      final pageCompleter = _pageCompleters[pages.first];
      final operationCompleter = completers[pages.first];
      if (pageCompleter == null || operationCompleter == null) {
        return false;
      }
      return operationCompleter.canPerformAction(pageCompleter);
    }

    try {
      final paginationParams = PaginationParams(
        limit: maxPage * limit,
        offset: 0,
      );
      final response = await loadCountItems(
        paginationParams: paginationParams,
      );
      final totalCount = response.totalCount;
      final isCancelled = !isSync();
      for (final page in pages) {
        final items = response.results.paginate(page, limit).toList();
        final updateCount = _getPageUpdateCount(page);
        final pageState = PaginationPageState(
          items: [...items],
          isLoading: false,
          updateCount: updateCount,
        );
        final paginationPageResponse = PaginationPageResponse(
          page: pageState,
          totalCount: response.totalCount,
          paginationParams: paginationParams,
        );
        completers[page]?.complete(paginationPageResponse);
        temp[page] = [...items];
      }

      return PaginationBatchResponse<T>(
        totalCount: totalCount,
        cancelled: isCancelled,
        pageItems: temp,
      );
    } catch (e, stk) {
      for (final page in pages) {
        completers[page]?.completeError(e, stk);
      }
      final isCancelled = !isSync();
      return PaginationBatchResponse(
        totalCount: totalCount,
        cancelled: isCancelled,
        errorStacktrace: ErrorStackTrace(
          error: e,
          stackTrace: stk,
        ),
        pageItems: {},
      );
    }
  }

  Future<PaginationPageResponse<T>?> _initiatePageLoading(int page) async {
    final existCompleter = _pageCompleters[page];
    if (existCompleter != null && !existCompleter.isCompleted) {
      return existCompleter.future;
    } else {
      final completer = FlexibleCompleter<PaginationPageResponse<T>>();

      bool isSync() {
        final result = completer.canPerformAction(_pageCompleters[page]);
        return result;
      }

      try {
        _pageCompleters[page] = completer;
        _increasePageUpdateCount(page);
        final paginationParams = PaginationParams.fromPage(
          limit: stateOrNull?.limit ?? initialLimit,
          page: page,
        );
        final countItems = await loadCountItems(
          paginationParams: paginationParams,
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
            paginationParams: paginationParams,
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
  void beforeBuild() {}

  @protected
  void beforeRefresh() {}

  @protected
  void afterRefresh() {}

  @protected
  PaginationState<T, Z, Y> initiateBuild() {
    ref.onDispose(
      () {
        try {
          beforeRefresh();
        } catch (_) {}
        _clearAndReset();
      },
    );
    beforeBuild();
    final state = stateOrNull;
    final closestPage = _getMaxClosedPage();
    final resetToZero = _mustResetToZeroPage;
    final reloadPreviousPages = _mustReloadPreviousPages;
    final initPage = resetToZero ? 0 : closestPage ?? this.initialPage;
    var resetTimes = state?.resetTimes ?? 0;
    if (resetToZero) {
      _mustResetToZeroPage = false;
      _pageUpdateCount.clear();
      resetTimes++;
    }

    if (reloadPreviousPages) {
      _mustReloadPreviousPages = false;
    }

    final newState = _valueTransformer(
      PaginationState<T, Z, Y>(
        cachedBeforeRefresh: useCacheOnReload,
        initialLoaded: initialLoaded,
        refreshing: refreshing,
        initialLoading: initialLoading,
        resetTimes: resetTimes,
        initialPage: initPage,
        currentPage: initPage,
        extraArgs: state?.extraArgs,
        limit: state?.limit ?? initialLimit,
        loadParams: state?.loadParams ?? initialLoadParams,
        totalCount: state?.totalCount ?? 0,
        mixedItems: useCacheOnReload ? (state?.mixedItems ?? []) : [],
        items: useCacheOnReload ? (state?.items ?? []) : [],
        pageItems: useCacheOnReload ? (state?.pageItems ?? {}) : {},
      ),
    );
    final lastPage = state?.loadedPages.lastOrNull;
    if (reloadPreviousPages && lastPage != null) {
      loadToMax(lastPage + 1);
    } else {
      if (autoStart) {
        loadPage(initPage);
        loadPage(0);
      }
    }

    return newState;
  }
}
