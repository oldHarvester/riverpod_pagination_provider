import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  NavigatorState get navigator => Navigator.of(this);

  Future<T?> push<T>({required Widget child}) {
    return navigator.push(
      MaterialPageRoute(
        builder: (context) {
          return child;
        },
      ),
    );
  }
}
