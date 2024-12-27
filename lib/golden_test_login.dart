import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:exam_practice/main.dart';
import 'package:exam_practice/transaction_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_practice/blocs/auth/auth_bloc.dart';
import 'package:exam_practice/auth.dart';
import 'package:exam_practice/blocs/transactions/transactions_bloc.dart';
import 'package:exam_practice/blocs/transactions/transactions_event.dart';

void main() {
  testWidgets('Golden test for TransactionPage', (WidgetTester tester) async {
    // Initialize the TransactionPage with required dependencies
    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AuthBloc(auth: Auth())),
            BlocProvider(
              create: (context) => TransactionsBloc()..add(TransactionsFetchEvent()),
            ),
          ],
          child: TransactionPage(),
        ),
      ),
    );

    // Wait for animations or build process
    await tester.pumpAndSettle();

    // Capture the golden file
    await expectLater(
      find.byType(TransactionPage),
      matchesGoldenFile('goldens/transaction_page.png'),
    );
  });
}
