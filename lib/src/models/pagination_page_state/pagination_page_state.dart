import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_page_state.freezed.dart';

@Freezed(
  fromJson: false,
  toJson: false,
  genericArgumentFactories: true,
  makeCollectionsUnmodifiable: true,
)
abstract class PaginationPageState<T> with _$PaginationPageState<T> {
  const PaginationPageState._();

  const factory PaginationPageState({
    @Default([]) List<T> items,
    Object? error,
    @Default(true) bool isLoading,
    @Default(0) int updateCount,
  }) = _PaginationPageState<T>;
}
