abstract class JuiceState {}

class JuiceInitial extends JuiceState {}

class JuiceLoading extends JuiceState {}

//Array used as we'd logically have multiple items or renders.
class JuiceLoaded extends JuiceState {
  final List<Map<String, dynamic>> juice_data;

  JuiceLoaded({required this.juice_data});
}

class JuiceError extends JuiceState {
  final String error;

  JuiceError({required this.error});
}
