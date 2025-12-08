import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_pagination_provider/src/models/error_stacktrace/error_stacktrace.dart';

import '../../../riverpod_pagination_provider.dart';

part 'pagination_batch_response.freezed.dart';

@Freezed(genericArgumentFactories: true)
abstract class PaginationBatchResponse<T> with _$PaginationBatchResponse {
  const PaginationBatchResponse._();

  const factory PaginationBatchResponse({
    @Default({}) Map<int, List<T>> pageItems,
    ErrorStackTrace? errorStacktrace,
    required int totalCount,
    required bool cancelled,
  }) = _PaginationBatchResponse;

  Map<int, PaginationPageState<T>> pageStates(
    int Function(int page) updateCount,
  ) {
    return (pageItems as Map<int, List<T>>).map(
      (key, value) {
        return MapEntry(
          key,
          PaginationPageState(
            errorStackTrace: errorStacktrace,
            isLoading: false,
            items: value,
            updateCount: updateCount(key),
          ),
        );
      },
    );
  }
}
