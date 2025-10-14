import 'package:riverpod_pagination_provider/src/models/pagination_relative_index/pagination_relative_index.dart';

abstract class PaginationHelpers {
  static PaginationRelativeIndex getRelativeIndex(
    int index,
    int totalCount,
    int limit,
  ) {
    // Ensure that limit is positive
    if (limit <= 0) {
      throw ArgumentError('Limit must be greater than zero');
    }

    // Calculate progress as a percentage of totalCount
    final progress = (index + 1) / totalCount;

    // Determine the current page, ensuring it falls within the range
    final page = (index / limit).floor();

    // Calculate the index within the current page
    final relativeIndex = index % limit;

    // Calculate page progress as the relative index divided by the limit
    final pageProgress = (index + 1) / limit;

    return PaginationRelativeIndex(
      page: page,
      totalProgress: progress,
      relativeIndex: relativeIndex,
      pageProgress: pageProgress,
      absoluteIndex: index,
    );
  }
}
