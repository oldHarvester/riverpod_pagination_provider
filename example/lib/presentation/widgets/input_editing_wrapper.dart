import 'package:example/presentation/widgets/input_tile.dart';
import 'package:flutter/cupertino.dart';

class InputEditingControllerProvider extends InheritedWidget {
  const InputEditingControllerProvider({
    super.key,
    required super.child,
    required this.controller,
  });

  final InputEditingController controller;

  @override
  bool updateShouldNotify(covariant InputEditingControllerProvider oldWidget) {
    return oldWidget.controller != controller;
  }
}

class InputEditingController extends ValueNotifier<bool> {
  InputEditingController() : super(false);

  static InputEditingController of(BuildContext context) {
    return maybeOf(context)!;
  }

  static InputEditingController? maybeOf(BuildContext context) {
    try {
      return context
          .dependOnInheritedWidgetOfExactType<InputEditingControllerProvider>()
          ?.controller;
    } catch (e) {
      throw UnimplementedError(
        'InputEditingController not found in BuildContext',
      );
    }
  }

  void startEditing() {
    value = true;
  }

  void endEditing() {
    value = false;
  }
}

class InputEditingWrapper extends StatefulWidget {
  const InputEditingWrapper({
    super.key,
    this.initialText,
    this.onChanged,
    this.onFieldSubmitted,
    required this.builder,
  });

  static int _counter = 0;

  static int getId() {
    return _counter++;
  }

  final String? initialText;
  final Widget Function(
    BuildContext context,
    InputEditingController controller,
  )
  builder;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  State<InputEditingWrapper> createState() => _InputEditingWrapperState();
}

class _InputEditingWrapperState extends State<InputEditingWrapper> {
  final InputEditingController _editingController = InputEditingController();
  final int groupId = InputEditingWrapper.getId();

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      groupId: groupId,
      onTapInside: (event) {
        _editingController.startEditing();
      },
      onTapOutside: (event) {
        _editingController.endEditing();
      },
      child: InputEditingControllerProvider(
        controller: _editingController,
        child: ValueListenableBuilder(
          valueListenable: _editingController,
          builder: (context, value, child) {
            if (value) {
              return InputTile(
                autofocus: true,
                groupId: groupId,
                initialText: widget.initialText,
                onFieldSubmitted: widget.onFieldSubmitted,
                onEditingComplete: () {
                  _editingController.endEditing();
                },
                onChanged: widget.onChanged,
              );
            } else {
              return widget.builder(context, _editingController);
            }
          },
        ),
      ),
    );
  }
}
