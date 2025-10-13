import 'package:example/presentation/providers/test_notifier_provider_family.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/error_placeholder.dart';
import '../widgets/loading_placeholder.dart';

class TestFamilyNotifierPage extends StatefulWidget {
  const TestFamilyNotifierPage({super.key});

  @override
  State<TestFamilyNotifierPage> createState() => _TestFamilyNotifierPageState();
}

class _TestFamilyNotifierPageState extends State<TestFamilyNotifierPage> {
  final ValueNotifier<int> _counter = ValueNotifier(0);

  void _increment() {
    _counter.value = _counter.value + 1;
  }

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _counter,
      builder: (context, counter, child) {
        return Consumer(
          builder: (context, ref, child) {
            final testFamilyProvider = testNotifierFamilyProvider(counter);
            final testState = ref.watch(testFamilyProvider);
            final testController = ref.watch(testFamilyProvider.notifier);
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: _increment,
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
          },
        );
      },
    );
  }
}
