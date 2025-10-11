import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_toolkit/utils/custom_logger.dart';

final exampleProvider = FutureProvider.autoDispose.family<List<int>, int>(
  (ref, arg) async {
    final logger = CustomLogger(owner: 'ExampleProvider: $arg');
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
    final items = await Future.delayed(
      Duration(seconds: 1),
      () {
        return List.generate(
          10,
          (index) {
            return math.Random().nextInt(10);
          },
        );
      },
    );
    return items;
  },
);
