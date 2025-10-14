part of 'pagination_provider.dart';

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

  /// Debug label for logger
  String? get debugLabel => null;

  /// IF set to true watchPage will reexecute process of fetching page if error occurs
  bool get watchErrors => false;

  /// IF set to true provider will load initial page from start
  bool get autoStart => true;

  int get initialLimit => 10;

  int get initialPage => 0;

  bool _initialLoaded = false;

  bool get initialLoaded => _initialLoaded;

  Future<PaginatedListResponse<T>> fetchItems(
    Z loadParams,
    Y? arg,
    PaginationParams paginationParams,
  );

  void _log(Object object) {
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
    _refreshThrottler.execute(
      duration: schedule ? throttleDuration : Duration.zero,
      onAction: () {
        markResetToZero();
        refresh();
      },
    );
  }

  void refresh({bool schedule = false}) {
    _refreshThrottler.execute(
      duration: schedule ? throttleDuration : Duration.zero,
      onAction: () {
        ref.invalidateSelf();
      },
    );
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
    _refreshCompleter = FlexibleCompleter();
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
    bool resetState = true,
  }) {
    final newParams = onChange(state.loadParams);
    if (state.loadParams != newParams) {
      updateState(
        state.copyWith(
          loadParams: newParams,
        ),
      );
      if (resetState) {
        reset(schedule: throttle);
      } else {
        refresh(schedule: throttle);
      }
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
      changeState(
        state.copyWith(currentPage: lastPage),
      );
    }
  }

  PaginationState<T, Z, Y> _valueTransformer(PaginationState<T, Z, Y> value) {
    return value.copyWith(
      items: PaginationState.fromPageItems(
        {...value.pageItems},
      ),
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

        if (pageState != null && !pageState.hasError) {
          return;
        }
      }

      if (updateType == PaginationUpdateType.clearOthers) {
        _clearAndReset();
        updateState(
          oldState.copyWith(
            pageItems: const {},
          ),
        );
      }
    }

    final refreshCompleter = _refreshCompleter;
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

      if (totalCountChanged && !refreshing) {
        _onTotalCountChanged(response.totalCount);
      } else {
        updateState(
          state.copyWith(
            totalCount: response.totalCount,
            pageItems: currentPageItems,
          ),
        );
        if (refreshCompleter.canPerformAction(_refreshCompleter)) {
          _initialLoaded = true;
        }
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
      }
    } finally {
      if (refreshCompleter.canPerformAction(_refreshCompleter)) {
        refreshCompleter.complete();
        changeState(
          state.copyWith(
            initialLoading: initialLoading,
            initialLoaded: initialLoaded,
            refreshing: refreshing,
          ),
        );
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
        final result = completer.canPerformAction(_pageCompleters[page]);
        return result;
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
    ref.onDispose(_clearAndReset);
    final state = stateOrNull;
    final closestPage = _getMaxClosedPage();
    final resetToZero = _mustResetToZeroPage;
    final initPage = resetToZero ? 0 : closestPage ?? this.initialPage;
    var resetTimes = state?.resetTimes ?? 0;
    if (resetToZero) {
      _mustResetToZeroPage = false;
      _pageUpdateCount.clear();
      resetTimes++;
    }

    final newState = PaginationState<T, Z, Y>(
      initialLoaded: initialLoaded,
      refreshing: refreshing,
      initialLoading: initialLoading,
      resetTimes: resetTimes,
      initialPage: initPage,
      items: PaginationState.fromPageItems({}),
      currentPage: initPage,
      limit: state?.limit ?? initialLimit,
      loadParams: state?.loadParams ?? initialLoadParams,
      totalCount: state?.totalCount ?? 0,
      pageItems: {},
    );
    if (autoStart) {
      loadPage(initPage);
    }
    return newState;
  }
}
