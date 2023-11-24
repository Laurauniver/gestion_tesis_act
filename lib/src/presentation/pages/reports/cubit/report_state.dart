part of 'report_cubit.dart';

sealed class ReportState extends Equatable {
  @override
  List<Object> get props => [];
}

final class ReportInitial extends ReportState {}

final class ReportLoading extends ReportState {}

final class ReportsSuccessful extends ReportState {
  final List<TutorModel> tutors;

  ReportsSuccessful({required this.tutors});
}

final class ReportFailure extends ReportState {
  final String message;

  ReportFailure({required this.message});
}
