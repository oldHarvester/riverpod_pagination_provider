import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_params.freezed.dart';

enum PaginationParamsQueryType {
  limitOffset,
  pageLimit,
}

@Freezed(fromJson: false, toJson: false)
abstract class PaginationParams with _$PaginationParams {
  const PaginationParams._();

  factory PaginationParams.fromPage({
    required int page,
    required int limit,
  }) {
    return PaginationParams(
      limit: limit,
      offset: page * limit,
    );
  }

  const factory PaginationParams({
    required int limit,
    required int offset,
  }) = _PaginationParams;

  int get page => (offset / limit).floor();

  Map<String, dynamic> toQuery({
    PaginationParamsQueryType type = PaginationParamsQueryType.limitOffset,
  }) {
    return switch (type) {
      PaginationParamsQueryType.limitOffset => {
        "limit": limit,
        "offset": offset,
      },
      PaginationParamsQueryType.pageLimit => {
        "page": page,
        "limit": limit,
      },
    };
  }
}
