import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_pagination_provider/src/models/pagination_page_state/pagination_page_state.dart';

part 'pagination_state.freezed.dart';

@Freezed(
  fromJson: false,
  toJson: false,
  genericArgumentFactories: true,
  addImplicitFinal: true,
  makeCollectionsUnmodifiable: true,
)
abstract class PaginationState<T, Z> with _$PaginationState<T, Z> {
  const factory PaginationState({
    required Map<int, PaginationPageState<T>> pageItems,
    required List<T> items,
    required Z loadParams,
    required int totalCount,
    required int limit,
    @Default(0) int currentPage,
    @Default(0) int resetTimes,
  }) = _PaginationState<T, Z>;
}
