import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_relative_index.freezed.dart';

@Freezed(fromJson: false, toJson: false)
abstract class PaginationRelativeIndex with _$PaginationRelativeIndex {
  const factory PaginationRelativeIndex({
    required int page,
    required double pageProgress,
    required double totalProgress,
    required int index,
  }) = _PaginationRelativeIndex;
}
