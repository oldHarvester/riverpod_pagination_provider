import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../riverpod_pagination_provider.dart';

part 'pagination_page_response.freezed.dart';

@Freezed(genericArgumentFactories: true, fromJson: false, toJson: false)
abstract class PaginationPageResponse<Item> with _$PaginationPageResponse<Item> {
  const factory PaginationPageResponse({
    required PaginationPageState<Item> page,
    required int totalCount,
    required PaginationParams paginationParams,
  }) = _PaginationPageResponse<Item>;
}
