import 'package:freezed_annotation/freezed_annotation.dart';
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
    @Default(0) int currentPage,
    @Default(0) int resetTimes,
  }) = _PaginationState<T, Z, Y>;

  static List<T> fromPageItems<T>(
    Map<int, PaginationPageState<T>> pageItems, {
    bool onlyOrdered = true,
  }) {
    final pages =
        pageItems.keys.toList()..sort(
          (a, b) => a.compareTo(b),
        );
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
      if (pageState == null || pageState.error != null) {
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

  List<T> getAllOrderedItems() {
    return fromPageItems(pageItems, onlyOrdered: false);
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
      return pageItems[relativeIndex.page]?.items[relativeIndex.index];
    } catch (e) {
      return null;
    }
  }

  bool get isInitialLoading => getPageState(0).isLoading;

  Object? get initialError => getPageState(0).error;

  bool get isEmpty {
    return !isInitialLoading && totalCount == 0;
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
  }) {
    final initialPageState = getPageState(0);
    final isLoading = initialPageState.isLoading;
    final pageError = initialPageState.error;
    return isLoading
        ? loading()
        : pageError != null
        ? error(error, StackTrace.current)
        : data(this);
  }
}
