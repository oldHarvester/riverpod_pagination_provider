import 'package:example/presentation/providers/test_notifier_state_provider.dart';
import 'package:example/presentation/widgets/text_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_pagination_provider/riverpod_pagination_provider.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../widgets/error_placeholder.dart';
import '../widgets/loading_placeholder.dart';

class TestNotifierStatePage extends ConsumerStatefulWidget {
  const TestNotifierStatePage({super.key});

  @override
  ConsumerState<TestNotifierStatePage> createState() =>
      _TestNotifierStatePageState();
}

class _TestNotifierStatePageState extends ConsumerState<TestNotifierStatePage> {
  Widget captionBuilder({
    required String title,
    required String caption,
  }) {
    return Text(
      '$title: $caption',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget buildChoices<T>({
    String? title,
    List<T> choices = const [],
    void Function(T choice)? onSelect,
  }) {
    final padding = EdgeInsets.symmetric(horizontal: 16);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null)
          Padding(
            padding: padding,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        SingleChildScrollView(
          padding: padding,
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 16,
            children: List.generate(
              choices.length,
              (index) {
                final choice = choices[index];
                return Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {
                      onSelect?.call(choice);
                    },
                    customBorder: CircleBorder(),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.red,
                      child: Text(
                        choice.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final testState = ref.watch(testNotifierStateProvider);
    final testController = ref.watch(testNotifierStateProvider.notifier);
    final limit = testState.limit;
    final currentPage = testState.currentPage;
    const limitChoices = [1, 5, 8, 10, 15, 20];
    final loadItemsChoices = [10, 20, 50, 100];
    const padding = EdgeInsets.symmetric(horizontal: 16);
    final loadParams = testState.loadParams;
    final loadItems = loadParams.loadItems;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: testController.reset,
        child: Icon(Icons.refresh),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildChoices(
              title: 'Limit choices',
              choices: limitChoices,
              onSelect: (choice) {
                testController.changeLimit(choice);
              },
            ),
            buildChoices(
              title: 'Load items choices',
              choices: loadItemsChoices,
              onSelect: (choice) {
                testController.changeLoadParams(
                  resetType: PaginationResetType.refresh,
                  (current) {
                    return current.copyWith(
                      loadItems: choice,
                    );
                  },
                );
              },
            ),
            Padding(
              padding: padding,
              child: Row(
                children: [
                  Expanded(
                    child: captionBuilder(
                      title: 'Current page',
                      caption: currentPage.toString(),
                    ),
                  ),
                  Expanded(
                    child: captionBuilder(
                      title: 'Load items',
                      caption: loadItems.toString(),
                    ),
                  ),
                  Expanded(
                    child: captionBuilder(
                      title: 'Limit',
                      caption: limit.toString(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Divider(
                indent: 1,
                endIndent: 1,
                height: 1,
                thickness: 1,
              ),
            ),
            Expanded(
              child: testState.when(
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
                  final totalCount = state.totalCount;
                  const itemHeight = 64.0;
                  final dividerHeight = 1.0;
                  final itemsPerPage = state.limit;
                  final totalPages = state.maxPages;
                  final resetTimes = state.resetTimes;
                  return KeyedSubtree(
                    key: ValueKey(resetTimes),
                    child: CustomScrollView(
                      slivers: [
                        SliverPadding(
                          padding: EdgeInsets.all(16.0),
                          sliver: SliverSafeArea(
                            sliver: SliverStack(
                              children: [
                                SliverList.separated(
                                  itemBuilder: (context, index) {
                                    final item = state.itemByIndex(index);
                                    testController.onItemBuild(index);
                                    return SizedBox(
                                      height: itemHeight,
                                      child: item == null
                                          ? SizedBox.shrink()
                                          : TextTile(
                                              text: item,
                                              height: itemHeight,
                                            ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Container(
                                      height: dividerHeight,
                                      color: Colors.grey,
                                    );
                                  },
                                  itemCount: totalCount,
                                ),
                                SliverPositioned.fill(
                                  child: SingleChildScrollView(
                                    physics: NeverScrollableScrollPhysics(),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Column(
                                        children: List.generate(
                                          totalPages,
                                          (pageIndex) {
                                            final pageHeight =
                                                itemsPerPage *
                                                (itemHeight + dividerHeight);
                                            final borderSide = BorderSide(
                                              color: Colors.red,
                                              width: 10,
                                            );
                                            return Container(
                                              height: pageHeight,
                                              width: double.maxFinite,
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  top: pageIndex == 0
                                                      ? borderSide
                                                      : BorderSide.none,
                                                  left: borderSide,
                                                  right: borderSide,
                                                  bottom: borderSide,
                                                ),
                                              ),
                                              child: Center(
                                                child: Opacity(
                                                  opacity: 0.2,
                                                  child: Text(
                                                    pageIndex.toString(),
                                                    style: TextStyle(
                                                      fontSize: 40,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
