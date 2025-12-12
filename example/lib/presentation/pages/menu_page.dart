import 'package:example/presentation/pages/test_family_notifier_page.dart';
import 'package:example/presentation/pages/test_infinite_page_2.dart';
import 'package:example/presentation/pages/test_notifier_page.dart';
import 'package:example/presentation/pages/test_notifier_state_page.dart';
import 'package:example/presentation/pages/without_builder_page.dart';
import 'package:example/utils/context_extension.dart';
import 'package:flutter/material.dart';

import 'test_infinite_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.push(
                  child: TestNotifierPage(),
                );
              },
              child: Text('Test Notifier Page'),
            ),
            ElevatedButton(
              onPressed: () {
                context.push(child: TestFamilyNotifierPage());
              },
              child: Text('Test Family Notifier Page'),
            ),
            ElevatedButton(
              onPressed: () {
                context.push(child: TestNotifierStatePage());
              },
              child: Text('Test Notifier State Page'),
            ),
            ElevatedButton(
              onPressed: () {
                context.push(child: WithoutBuilderPage());
              },
              child: Text('Test Without builder'),
            ),
            ElevatedButton(
              onPressed: () {
                context.push(child: TestInfinitePage());
              },
              child: Text(
                "Test Infinite Page",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.push(child: TestInfinitePage2());
              },
              child: Text('Test Infinite Page 2'),
            ),
          ],
        ),
      ),
    );
  }
}
