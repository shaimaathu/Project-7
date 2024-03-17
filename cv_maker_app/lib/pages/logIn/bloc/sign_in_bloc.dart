import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cv_maker_app/service/supabase_services.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInEvent>((event, emit) {});
    on<AddSignInEvent>(signin);
  }

  FutureOr<void> signin(AddSignInEvent event, Emitter<SignInState> emit) async {
    try {
      emit(LoadingSignInState());
      await Database().logIn(email: event.email, password: event.password);
      emit(SuccessSignInState());
    } catch (error) {
      emit(ErrorSignInState());
    }
  }
}
