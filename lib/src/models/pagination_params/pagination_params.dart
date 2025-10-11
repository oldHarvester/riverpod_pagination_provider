import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_params.freezed.dart';

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
}
