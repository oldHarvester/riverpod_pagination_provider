import 'package:example/presentation/providers/test_notifier_state_provider.dart';
import 'package:example/presentation/widgets/loading_placeholder.dart';
import 'package:example/presentation/widgets/test_scroll_view.dart';
import 'package:example/presentation/widgets/text_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/error_placeholder.dart';

class WithoutBuilderPage extends ConsumerStatefulWidget {
  const WithoutBuilderPage({super.key});

  @override
  ConsumerState<WithoutBuilderPage> createState() => _WithoutBuilderPageState();
}

class _WithoutBuilderPageState extends ConsumerState<WithoutBuilderPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  void onLoadMore() {
    final controller = ref.read(testNotifierStateProvider.notifier);
    controller.loadNext();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = ref.watch(testNotifierStateProvider);
    return items.when(
      loading: () {
        return LoadingPlaceholder();
      },
      error: (error, stackTrace) {
        return ErrorPlaceholder(
          error: error,
          onRefresh: () {
            ref.invalidate(testNotifierStateProvider);
          },
        );
      },
      data: (state) {
        final items = state.items;
        return Scaffold(
          body: SafeArea(
            child: TestScrollView(
              onLoadMore: () {
                onLoadMore();
              },
              children: List.generate(
                items.length,
                (index) {
                  final item = items[index];
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextTile(
                        text: item,
                        height: 64,
                      ),
                      Container(
                        height: 2,
                        color: Colors.grey,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
