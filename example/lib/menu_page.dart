import 'package:example/first_page.dart';
import 'package:example/second_page.dart';
import 'package:example/utils/context_extension.dart';
import 'package:flutter/material.dart';

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
                context.push(child: FirstPage());
              },
              child: Text('First page'),
            ),
            ElevatedButton(
              onPressed: () {
                context.push(child: SecondPage());
              },
              child: Text('Second page'),
            ),
          ],
        ),
      ),
    );
  }
}
