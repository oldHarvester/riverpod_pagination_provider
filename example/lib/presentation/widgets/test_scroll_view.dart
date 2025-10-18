import 'package:flutter/material.dart';
import 'package:flutter_toolkit/flutter_toolkit.dart';

class TestScrollView extends StatefulWidget {
  const TestScrollView({
    super.key,
    required this.children,
    this.scrollController,
    required this.onLoadMore,
  });

  final List<Widget> children;
  final ScrollController? scrollController;
  final VoidCallback? onLoadMore;

  @override
  State<TestScrollView> createState() => _TestScrollViewState();
}

class _TestScrollViewState extends State<TestScrollView> {
  final SafeExecutor _frameExecutor = SafeExecutor();
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
    _scrollController.addListener(
      () {
        final position = _scrollController.position.pixels;
        final maxPosition = _scrollController.position.maxScrollExtent;
        final difference = maxPosition - position;
        final renderObject = context.findRenderObject() as RenderBox?;
        final renderHeight = renderObject?.size.height;

        if (renderHeight != null && difference < renderHeight / 2) {
          widget.onLoadMore?.call();
        }
      },
    );
    _checkNoScroll();
  }

  void _checkNoScroll() {
    _frameExecutor.cancel();
    _frameExecutor.perform(
      () {
        if (_scrollController.position.maxScrollExtent == 0) {
          widget.onLoadMore?.call();
        }
      },
    );
  }

  @override
  void didUpdateWidget(covariant TestScrollView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.children.length != widget.children.length) {
      _checkNoScroll();
    }
  }

  @override
  void dispose() {
    _frameExecutor.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      controller: _scrollController,
      child: Column(
        children: widget.children,
      ),
    );
  }
}
