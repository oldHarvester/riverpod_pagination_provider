import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../riverpod_pagination_provider.dart';

part 'pagination_page_response.freezed.dart';

@Freezed(genericArgumentFactories: true, fromJson: false, toJson: false)
abstract class PaginationPageResponse<T> with _$PaginationPageResponse<T> {
  const factory PaginationPageResponse({
    required PaginationPageState<T> page,
    required int totalCount,
    required PaginationParams paginationParams,
  }) = _PaginationPageResponse<T>;
}
