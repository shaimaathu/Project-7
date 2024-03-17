part of 'cv_bloc.dart';

@immutable
sealed class CvState {}

final class CvInitial extends CvState {}

final class ErrorState extends CvState {}

final class LaudingState extends CvState {}

final class DisplayAllCvsState extends CvState {
  final List<CVModel> cvs;
  DisplayAllCvsState({required this.cvs});
}

final class DisplayUserCvsState extends CvState {
  final List<CVModel> cvs;
  DisplayUserCvsState({required this.cvs});
}
