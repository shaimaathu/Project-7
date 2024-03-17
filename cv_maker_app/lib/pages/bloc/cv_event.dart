part of 'cv_bloc.dart';

@immutable
sealed class CvEvent {}

class FetchAllCvEvent extends CvEvent {}

class FetchUserCvEvent extends CvEvent {}

class AddCvEvent extends CvEvent {}

class EditCvEvent extends CvEvent {}

class DeleteCvEvent extends CvEvent {
  final String id;
  DeleteCvEvent({required this.id});
}
