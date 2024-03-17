import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cv_maker_app/data/data_layer.dart';
import 'package:cv_maker_app/data/model/cv_model.dart';
import 'package:cv_maker_app/service/supabase_services.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'cv_event.dart';
part 'cv_state.dart';

class CvBloc extends Bloc<CvEvent, CvState> {
  final locator = GetIt.I.get<AllData>();
  CvBloc() : super(CvInitial()) {
    on<CvEvent>((event, emit) {});
    on<FetchAllCvEvent>(fetchData);
    on<FetchUserCvEvent>(fetchUserCvs);
    on<DeleteCvEvent>(deleteCv);
    on<AddCvEvent>(addCv);
    // on<EditNotesEvent>(editNots);
  }
  FutureOr<void> addCv(AddCvEvent event, Emitter<CvState> emit) async {
    try {
      emit(LaudingState());
      final serviceLocator = Database();
      serviceLocator.addCV();
      List<CVModel> userCv = await serviceLocator.fetchUserCv();
      emit(DisplayUserCvsState(cvs: userCv));
    } catch (error) {
      emit(ErrorState());
    }
  }

  FutureOr<void> fetchData(FetchAllCvEvent event, Emitter<CvState> emit) async {
    try {
      emit(LaudingState());
      final serviceLocator = Database();
      emit(DisplayAllCvsState(cvs: await serviceLocator.fetchCV()));
    } catch (error) {
      emit(ErrorState());
    }
  }

  FutureOr<void> fetchUserCvs(
      FetchUserCvEvent event, Emitter<CvState> emit) async {
    try {
      emit(LaudingState());
      print("idddddd-------------------");
      final serviceLocator = Database();
      await serviceLocator.getUserByToken();
      print("id");
      List<CVModel> userCv = await serviceLocator.fetchUserCv() ?? [];
      print("${userCv.length}");
      emit(DisplayUserCvsState(cvs: userCv));
    } catch (error) {
      emit(ErrorState());
    }
  }

  FutureOr<void> deleteCv(DeleteCvEvent event, Emitter<CvState> emit) async {
    try {
      emit(LaudingState());
      final serviceLocator = Database();
      serviceLocator.deleteCv(id: event.id);
      List<CVModel> userCv = await serviceLocator.fetchUserCv();
      emit(DisplayUserCvsState(cvs: userCv));
    } catch (error) {
      emit(ErrorState());
    }
  }

  // FutureOr<void> editNots(
  //     EditNotesEvent event, Emitter<ProfileState> emit) async {
  //   try {
  //     final serviceLocator = Database();
  //     serviceLocator.editNote(
  //         content: event.content, userId: event.userId, id: event.id);
  //     emit(DisplayUserNotesState(
  //         notes: await serviceLocator.fetchUserNots(id: event.userId)));
  //   } catch (error) {
  //     emit(ErrorState());
  //   }
  // }
}
