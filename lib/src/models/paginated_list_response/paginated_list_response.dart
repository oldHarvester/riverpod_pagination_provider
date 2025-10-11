import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_list_response.freezed.dart';

@Freezed(
  fromJson: false,
  toJson: false,
  genericArgumentFactories: true,
  makeCollectionsUnmodifiable: true,
)
abstract class PaginatedListResponse<T> with _$PaginatedListResponse<T> {
  const PaginatedListResponse._();

  const factory PaginatedListResponse({
    required List<T> results,
    required int totalCount,
  }) = _PaginatedListResponse<T>;
}
