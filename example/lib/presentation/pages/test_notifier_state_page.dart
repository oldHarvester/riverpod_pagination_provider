import 'package:example/presentation/providers/test_notifier_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/error_placeholder.dart';
import '../widgets/loading_placeholder.dart';

class TestNotifierStatePage extends ConsumerStatefulWidget {
  const TestNotifierStatePage({super.key});

  @override
  ConsumerState<TestNotifierStatePage> createState() =>
      _TestNotifierStatePageState();
}

class _TestNotifierStatePageState extends ConsumerState<TestNotifierStatePage> {
  @override
  Widget build(BuildContext context) {
    final testState = ref.watch(testNotifierStateProvider);
    final testController = ref.watch(testNotifierStateProvider.notifier);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: testController.increment,
        child: Icon(Icons.add),
      ),
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
                final totalCount = state.totalCount;
                
                return ListView.separated(
                  itemBuilder: (context, index) {
                    final item = state.itemByIndex(index);
                    testController.onItemBuild(index);
                    return SizedBox(
                      height: 64,
                      child: item == null
                          ? SizedBox.shrink()
                          : Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: totalCount,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
