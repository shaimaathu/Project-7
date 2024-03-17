import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cv_maker_app/service/supabase_services.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  bool chosen = false;
  File? image;
  SignUpBloc() : super(SignUpInitial()) {
    on<CreateAccountEvent>(createAccount);
  }

  FutureOr<void> createAccount(
      CreateAccountEvent event, Emitter<SignUpState> emit) async {
    try {
      await Database().addUser(
          name: event.name, email: event.email, password: event.password);
      emit(SuccessState());
    } catch (error) {
      emit(ErrorState());
    }
  }
}
