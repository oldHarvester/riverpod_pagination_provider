import 'package:example/presentation/widgets/input_editing_wrapper.dart';
import 'package:example/presentation/widgets/loading_placeholder.dart';
import 'package:example/presentation/widgets/text_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_pagination_provider/riverpod_pagination_provider.dart';

import '../providers/test_notifier_provider.dart';

class TestInfinitePage extends ConsumerStatefulWidget {
  const TestInfinitePage({super.key});

  @override
  ConsumerState<TestInfinitePage> createState() => _TestInfinitePageState();
}

class _TestInfinitePageState extends ConsumerState<TestInfinitePage> {
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
      body: testState.listenInfinite(
        error: null,
        empty: null,
        loading: () {
          return LoadingPlaceholder();
        },
        data: (data, totalCount, resetTimes, itemByIndex) {
          return ListView.separated(
            key: ValueKey(resetTimes),
            itemCount: totalCount,
            itemBuilder: (context, index) {
              final item = itemByIndex(index);
              testController.onItemBuild(index);
              if (item == null) {
                return TextTile(text: 'Загрузка...');
              } else {
                return InputEditingWrapper(
                  initialText: item,
                  onFieldSubmitted: (value) {
                    testController.findAndUpdateItem(
                      (element) {
                        return item == element;
                      },
                      resolveUpdate: (item) {
                        return value;
                      },
                    );
                  },
                  builder: (context, controller) {
                    return TextTile(
                      text: item,
                    );
                  },
                );
              }
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          );
        },
      ),
    );
  }
}
