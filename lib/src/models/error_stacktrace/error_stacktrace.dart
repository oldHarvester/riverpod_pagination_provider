import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_stacktrace.freezed.dart';

@Freezed(fromJson: false, toJson: false)
abstract class ErrorStackTrace with _$ErrorStackTrace {
  const factory ErrorStackTrace({
    required Object error,
    required StackTrace stackTrace,
  }) = _ErrorStackTrace;
}
