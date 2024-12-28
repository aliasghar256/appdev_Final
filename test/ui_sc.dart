import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:exam_practice/weekly_expense_page.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return GoldenToolkit.runWithConfiguration(
    () async {
      await testMain();
    },
    config: GoldenToolkitConfiguration(
      skipGoldenAssertion: () => !Platform.isMacOS,
    ),
  );
}

void main() {
  group('WeeklyExpensePage Golden Test', () {
    testGoldens('WeeklyExpensePage Screenshot', (WidgetTester tester) async {
      final widgetUnderTest = MaterialApp(
        home: WeeklyExpensePage(),
      );

      await tester.pumpWidgetBuilder(
        widgetUnderTest,
        surfaceSize: const Size(400, 800),
      );

      await tester.pumpAndSettle();

      await screenMatchesGolden(tester, 'weekly_expense_page');
    });
  });
}
