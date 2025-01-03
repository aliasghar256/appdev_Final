abstract class JuiceState {}

class JuiceInitial extends JuiceState {
  final int quantity;

  JuiceInitial({required this.quantity});
}

class JuiceLoading extends JuiceState {}

//Array used as we'd logically have multiple items or renders.
class JuiceLoaded extends JuiceState {
  final List<Map<String, dynamic>> juice_data;
  int quantity;

  JuiceLoaded({required this.juice_data, this.quantity = 0});
}

class JuiceError extends JuiceState {
  final String error;

  JuiceError({required this.error});
}

// class JuiceCartQuantity extends JuiceState {
//   final int quantity;

//   JuiceCartQuantity({required this.quantity});
// }
