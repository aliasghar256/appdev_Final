import 'transactions_event.dart';
import 'transactions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc() : super(TransactionsInitial()){

  final FirebaseFirestore _store = FirebaseFirestore.instance;
    Future<List<Map<String, dynamic>>> fetchTransactions() async {
  final querySnapshot = await _store.collection('transactions').get();
  return querySnapshot.docs.map((doc) {
    final data = doc.data();
    return {
      'title': data['title'] ?? 'No Title', // Provide default value
      'amount': data['amount'] ?? 0.0, // Default to 0.0 for amount
      'date': data['date'] ?? 'No Date', // Handle missing or null dates
    };
  }).toList();
}


  on<TransactionsFetchEvent>((event, emit) async {
    emit(TransactionsLoading());
    try {
      final transactions = await fetchTransactions();
      print("Transactions: $transactions");
      emit(TransactionsLoaded(transactions: transactions));
    } catch (e) {
      emit(TransactionsError(error: e.toString()));
    }
  });

  on<TransactionsErrorEvent>((event, emit) {
    emit(TransactionsError(error: event.error));
  });
  }
}