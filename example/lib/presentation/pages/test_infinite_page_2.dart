import 'package:example/presentation/widgets/text_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_pagination_provider/riverpod_pagination_provider.dart';

import '../providers/test_notifier_provider.dart';

class TestInfinitePage2 extends ConsumerStatefulWidget {
  const TestInfinitePage2({super.key});

  @override
  ConsumerState<TestInfinitePage2> createState() => _TestInfinitePage2State();
}

class _TestInfinitePage2State extends ConsumerState<TestInfinitePage2> {
  @override
  Widget build(BuildContext context) {
    final testState = ref.watch(testNotifierProvider);
    final testController = ref.watch(testNotifierProvider.notifier);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          testController.reset(
            resetType: PaginationResetType.refresh,
          );
        },
      ),
      body: ListView.separated(
        itemCount: testState.totalCount,
        itemBuilder: (context, index) {
          final item = testState.itemByIndex(index);
          testController.onItemBuild(index);
          return TextTile(
            text: item ?? 'Загрузка...',
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}
