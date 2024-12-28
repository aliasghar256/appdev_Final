import 'package:exam_practice/auth.dart';
import 'package:exam_practice/blocs/juice/juice_bloc.dart';
import 'package:exam_practice/blocs/juice/juice_event.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import './login_signup_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/auth/auth_bloc.dart';
import 'blocs/transactions/transactions_bloc.dart';
import 'transaction_page.dart';
import 'blocs/transactions/transactions_event.dart';
import 'apple_headphones_widget.dart';

import 'weekly_expense_page.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:exam_practice/juice_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthBloc(
                auth: Auth(),
              ),
            ),
            BlocProvider(
              create: (context) =>
                  TransactionsBloc()..add(TransactionsFetchEvent()),
            ),
            BlocProvider(
              create: (context) => JuiceBloc()..add(JuiceFetchEvent()),
            ),
          ],
          child: WeeklyExpensePage(),
        ));
  }
}
