import 'package:flutter/material.dart';

class ErrorPlaceholder extends StatelessWidget {
  const ErrorPlaceholder({
    super.key,
    required this.error,
  });

  final Object error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error.toString(),
        textAlign: TextAlign.center,
      ),
    );
  }
}
