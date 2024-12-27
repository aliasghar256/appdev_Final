abstract class TransactionsState {}

class TransactionsInitial extends TransactionsState {}

class TransactionsLoading extends TransactionsState {}

class TransactionsLoaded extends TransactionsState {
  final List<Map<String, dynamic>> transactions;

  TransactionsLoaded({required this.transactions});
}

class TransactionsError extends TransactionsState {
  final String error;

  TransactionsError({required this.error});
}