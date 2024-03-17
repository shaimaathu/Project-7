import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cv_maker_app/pages/home%20page/home_page.dart';
import 'package:cv_maker_app/pages/profile%20page/profile.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  List<Widget> views = [
    const HomePage(),
    const ProfilePage(),
  ];
  int selctedIndex = 0;
  NavigationBloc() : super(NavigationInitial()) {
    on<NavigationEvent>((event, emit) {});
    on<ChangeNavEvent>(changePage);
  }

  FutureOr<void> changePage(
      ChangeNavEvent event, Emitter<NavigationState> emit) {
    selctedIndex = event.selectedPage;
    emit(ChangeNavState());
  }
}
