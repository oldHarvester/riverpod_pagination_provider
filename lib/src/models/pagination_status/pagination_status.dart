import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_status.freezed.dart';

@Freezed(fromJson: false, toJson: false)
/// Do not add any other objects
sealed class PaginationStatus with _$PaginationStatus {
  const PaginationStatus._();

  const factory PaginationStatus.loadingBeforeData() = LoadingBeforeDataStatus;

  const factory PaginationStatus.errorBeforeData() = ErrorBeforeDataStatus;

  const factory PaginationStatus.initialDataLoaded() = InitialDataLoadedStatus;
}
