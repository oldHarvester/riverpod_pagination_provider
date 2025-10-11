import 'dart:async';
import 'dart:math';

import 'package:flutter_toolkit/flutter_toolkit.dart';
import 'package:riverpod/riverpod.dart';

final exampleNotifierProvider =
    AsyncNotifierProvider.autoDispose.family<ExampleNotifier, List<int>, int>(
      (arg) {
        return ExampleNotifier(arg);
      },
    );

class ExampleNotifier extends AsyncNotifier<List<int>> {
  ExampleNotifier(this.arg);

  final int arg;

  @override
  FutureOr<List<int>> build() {
    final logger = CustomLogger(owner: 'ExampleNotifierProvider: $arg');
    ref.onCancel(
      () {
        logger.log('cancel');
      },
    );
    ref.onAddListener(
      () {
        logger.log('add listener');
      },
    );
    ref.onRemoveListener(
      () {
        logger.log('remove listener');
      },
    );
    ref.onResume(
      () {
        logger.log('resume');
      },
    );
    ref.onDispose(
      () {
        logger.log('dispose');
      },
    );
    logger.log('build');
    return Future.delayed(
      Duration(seconds: 1),
      () {
        return List.generate(
          10,
          (index) {
            return Random().nextInt(10);
          },
        );
      },
    );
  }
}
