abstract class TransactionsEvent {}

class TransactionsFetchEvent extends TransactionsEvent {}

class TransactionsAddEvent extends TransactionsEvent {
  final String transaction;

  TransactionsAddEvent({required this.transaction});
}

class TransactionsDeleteEvent extends TransactionsEvent {
  final String transaction;

  TransactionsDeleteEvent({required this.transaction});
}

class TransactionsErrorEvent extends TransactionsEvent {
  final String error;

  TransactionsErrorEvent({required this.error});
}