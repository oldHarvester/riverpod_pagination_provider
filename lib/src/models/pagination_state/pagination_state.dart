import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_pagination_provider/src/models/error_stacktrace/error_stacktrace.dart';
import 'package:riverpod_pagination_provider/src/models/pagination_page_state/pagination_page_state.dart';
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

  static List<T> extractItems<T>(
    PaginationState<T, dynamic, dynamic> state, {
    bool onlyOrdered = true,
  }) {
    final pageItems = {...state.pageItems};
    final pages = state.loadedPages;
    if (pages.isEmpty) {
      return [];
    } else if (pageItems.length == 1) {
      return [...pageItems[pages.first]!.items];
    }

    final temp = <T>[];
    final start = pages.first;
    final end = pages.last;

    for (var i = start; i <= end; i++) {
      final pageState = pageItems[i];
      if (pageState == null || pageState.hasError) {
        if (onlyOrdered) {
          break;
        }
      } else {
        temp.addAll([...pageState.items]);
      }
    }

    return temp;
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
    return extractItems(this, onlyOrdered: false);
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

  bool get isEmpty {
    return pageItems.isEmpty ||
        !pageItems.values
            .map(
              (value) => value.isEmpty,
            )
            .toList()
            .contains(true);
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
        return !state.isEmpty;
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
