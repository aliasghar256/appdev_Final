import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_practice/blocs/auth/auth_bloc.dart';
import 'package:exam_practice/blocs/transactions/transactions_bloc.dart';
import 'package:exam_practice/apple_headphones_widget.dart';


class MockAuthBloc extends Mock implements AuthBloc {}

class MockTransactionsBloc extends Mock implements TransactionsBloc {}

void main() {
  late MockAuthBloc mockAuthBloc;
  late MockTransactionsBloc mockTransactionsBloc;

  setUp(() {
    mockAuthBloc = MockAuthBloc();
    mockTransactionsBloc = MockTransactionsBloc();
  });

  testWidgets('AppleHeadphonesWidget renders correctly', (WidgetTester tester) async {
    // Arrange: Set up mock behavior if necessary
    when(mockAuthBloc.state).thenReturn(AuthInitial());
    when(mockTransactionsBloc.state).thenReturn(TransactionsInitial());

    // Act: Build and pump the widget
    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>.value(value: mockAuthBloc),
            BlocProvider<TransactionsBloc>.value(value: mockTransactionsBloc),
          ],
          child: AppleHeadphonesWidget(),
        ),
      ),
    );

    // Assert: Check if the AppleHeadphonesWidget is rendered as expected
    expect(find.byType(AppleHeadphonesWidget), findsOneWidget);

    // Add further widget-specific assertions
    expect(find.text('Apple Headphones'), findsOneWidget); // Adjust the text based on your widget
  });
}
