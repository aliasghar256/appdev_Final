import 'package:flutter/material.dart';
import 'blocs/transactions/transactions_bloc.dart';
import 'blocs/transactions/transactions_state.dart';
import 'blocs/transactions/transactions_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatelessWidget{
  const TransactionPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: BlocBuilder<TransactionsBloc,TransactionsState> (builder: (context,state){
        // context.read<TransactionsBloc>().add(TransactionsFetchEvent());
        if (state is TransactionsLoading){
          return Center(child: CircularProgressIndicator());
        }
        else if (state is TransactionsLoaded){
          final transactions = state.transactions;
          return ListView.builder(
            itemCount: state.transactions.length,
            itemBuilder: (context,index){
              final transaction = transactions[index];
              return ListTile(
                title: Text(transaction['title']),
                subtitle: Text(transaction['amount'].toString()),
              );
            },
          );
        }
        else if (state is TransactionsError){
          return Center(child: Text(state.error));
        }
        else{
          return Center(child: Text('No transactions found'));
        }
      }),
    );
  }
}