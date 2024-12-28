abstract class JuiceEvent {}

class JuiceFetchEvent extends JuiceEvent {}

class AddOneToCartEvent extends JuiceEvent {
  final int quantity;

  AddOneToCartEvent({required this.quantity});
}

class RemoveOneFromCartEvent extends JuiceEvent {
  final int quantity;

  RemoveOneFromCartEvent({required this.quantity});
}

class ReadMoreClickedEvent extends JuiceEvent {
  final String description;

  ReadMoreClickedEvent({required this.description});
}

class JuiceErrorEvent extends JuiceEvent {
  final String error;

  JuiceErrorEvent({required this.error});
}
