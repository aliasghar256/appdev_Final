import 'dart:async';
import 'dart:io';

import 'package:exam_practice/weekly_expense_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:exam_practice/weekly_expense_page.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return GoldenToolkit.runWithConfiguration(
    () async {
      // await preloadMaterialFonts();
      await testMain();
    },
    config: GoldenToolkitConfiguration(
      skipGoldenAssertion: () =>
          !Platform.isMacOS, // Skip assertions on unsupported platforms
    ),
  );
}

void main() {
  setUpAll(() async {
    await testExecutable(() {});
  });

  testGoldens('WeeklyExpensePage Golden Test', (WidgetTester tester) async {
    // Create the widget to test
    final widgetUnderTest = MaterialApp(
      home: Scaffold(
        body: WeeklyExpensePage(),
      ),
    );

    // Pump the widget into the golden tester
    await tester.pumpWidgetBuilder(
      widgetUnderTest,
      surfaceSize: const Size(400, 800), // Adjust size based on your widget
    );

    // Wait for any animations to complete
    await tester.pumpAndSettle();

    // Generate or validate the golden file
    await screenMatchesGolden(tester, 'weekly_expense_page');
  });
}

// /// Preload Material fonts to ensure golden tests render correctly
// Future<void> preloadMaterialFonts() async {
//   final fontLoader = FontLoader('Roboto');
//   fontLoader.addFont(rootBundle.load('packages/flutter/assets/Roboto-Regular.ttf'));
//   fontLoader.addFont(rootBundle.load('packages/flutter/assets/Roboto-Medium.ttf'));
//   await fontLoader.load();
// }
