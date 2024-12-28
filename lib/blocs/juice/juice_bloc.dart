import 'juice_event.dart';
import 'juice_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class JuiceBloc extends Bloc<JuiceEvent, JuiceState> {
  JuiceBloc() : super(JuiceInitial(quantity: 0)) {
    final FirebaseFirestore _store = FirebaseFirestore.instance;
    Future<List<Map<String, dynamic>>> fetchTransactions() async {
      final querySnapshot = await _store.collection('juice').get();
      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        return {
          'name': data['name'] ?? 'No Name',
          'price': data['price'] ?? 0.0,
          'description': data['description'] ?? 'No Descrip',
          'delivery time': data['delivery time'] ?? 'No Time',
          'serving': data['serving'] ?? 'No Serving',
          'imageURL': data['imageURL'] ?? 'No Image',
          'rating': data['rating'] ?? 0.0,
          'numberReviews': data['numberReviews'] ?? 0,
        };
      }).toList();
    }

    on<JuiceFetchEvent>((event, emit) async {
      emit(JuiceLoading());
      try {
        final juice_data = await fetchTransactions();
        print("juice: $juice_data");
        emit(JuiceLoaded(juice_data: juice_data));
      } catch (e) {
        emit(JuiceError(error: e.toString()));
      }
    });

    on<JuiceErrorEvent>((event, emit) {
      emit(JuiceError(error: event.error));
    });

    //I will use copyWith to update the state of quantity in the JuiceLoaded State. It'll modify the quantity & throw the same state, I could alternatively make it
    //fetch from firebase again but those wouldn't be good practices
    on<AddOneToCartEvent>((event, emit) {
      if (state is JuiceLoaded) {
        final currentState = state as JuiceLoaded;
        emit(JuiceLoaded(
            juice_data: currentState.juice_data,
            quantity: currentState.quantity + 1));
      }
    });

    on<RemoveOneFromCartEvent>((event, emit) {
      if (state is JuiceLoaded) {
        final currentState = state as JuiceLoaded;
        emit(JuiceLoaded(
            juice_data: currentState.juice_data,
            quantity: currentState.quantity - 1));
      }
    });
  }
}
