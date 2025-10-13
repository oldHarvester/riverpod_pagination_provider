import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/test_notifier_provider.dart';
import '../widgets/error_placeholder.dart';
import '../widgets/loading_placeholder.dart';

class TestNotifierPage extends ConsumerStatefulWidget {
  const TestNotifierPage({super.key});

  @override
  ConsumerState<TestNotifierPage> createState() => _TestNotifierPageState();
}

class _TestNotifierPageState extends ConsumerState<TestNotifierPage> {
  @override
  Widget build(BuildContext context) {
    final testState = ref.watch(testNotifierProvider);
    final testController = ref.watch(testNotifierProvider.notifier);
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: testState.when(
              loading: () {
                return LoadingPlaceholder();
              },
              error: (error, stackTrace) {
                return ErrorPlaceholder(error: error);
              },
              data: (state) {
                final items = state.items;
                return ListView.separated(
                  itemBuilder: (context, index) {
                    final item = items[index];
                    testController.onItemBuild(index);
                    return Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: items.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
