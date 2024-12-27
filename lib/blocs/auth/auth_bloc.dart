import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Auth auth;

  AuthBloc({required this.auth}) : super(AuthInitial()) {

  

  on<AuthSignupEvent> ((event,emit){
    emit(AuthLoading());
    try{
      auth.createUserWithEmailAndPassword(email: event.email, password: event.password);
      emit(AuthLoggedIn(user: auth.currentUser!));
    } catch (e) {
      emit(AuthInitial());
    }
  }
  );

  on<AuthLoginEvent>((event,emit){
    emit(AuthLoading());
    try{
      print("Poop");
      auth.signInWithEmailAndPassword(email: event.email, password: event.password);
      emit(AuthLoggedIn(user: auth.currentUser!));
      print("Logged in as ${auth.currentUser!.email}");
    } catch (e) {
      emit(AuthInitial());
    }
  });

  on<AuthSignoutEvent>((event,emit){
    emit(AuthLoading());
    try{
      auth.signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthInitial());
    }});

  }
}

