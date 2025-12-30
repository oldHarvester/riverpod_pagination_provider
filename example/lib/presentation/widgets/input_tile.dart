import 'package:flutter/material.dart';

class InputTile extends StatefulWidget {
  const InputTile({
    super.key,
    this.onChanged,
    this.initialText,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onTapOutside,
    this.onTapUpOutside,
    this.autofocus = false,
    this.groupId = EditableText,
  });

  final bool autofocus;
  final String? initialText;
  final void Function(String value)? onChanged;
  final VoidCallback? onEditingComplete;
  final Object groupId;
  final void Function(PointerDownEvent event)? onTapOutside;
  final void Function(PointerUpEvent event)? onTapUpOutside;
  final void Function(String text)? onFieldSubmitted;

  @override
  State<InputTile> createState() => _InputTileState();
}

class _InputTileState extends State<InputTile> {
  @override
  Widget build(BuildContext context) {
    // final border = OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(15),
    //   borderSide: BorderSide(
    //     color: Colors.grey,
    //     width: 1,
    //   ),
    // );

    // final borderSide = border.borderSide;
    return TextFormField(
      autofocus: widget.autofocus,
      groupId: widget.groupId,
      initialValue: widget.initialText,
      onTapOutside: widget.onTapOutside,
      onTapUpOutside: widget.onTapUpOutside,
      onChanged: widget.onChanged,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      textAlignVertical: TextAlignVertical.center,
      scrollPadding: EdgeInsets.zero,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,

        // border: border,
        // enabledBorder: border,
        // focusedBorder: border.copyWith(
        //   borderSide: borderSide.copyWith(
        //     color: Colors.deepOrange,
        //   ),
        // ),
        // disabledBorder: border.copyWith(
        //   borderSide: borderSide.copyWith(
        //     color: Colors.grey.shade200,
        //   ),
        // ),
        // focusedErrorBorder: border.copyWith(
        //   borderSide: borderSide.copyWith(
        //     color: Colors.red.shade900,
        //   ),
        // ),
        // errorBorder: border.copyWith(
        //   borderSide: borderSide.copyWith(
        //     color: Colors.red,
        //   ),
        // ),
      ),
    );
  }
}
