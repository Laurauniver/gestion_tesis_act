part of 'tesis_cubit.dart';

sealed class TesisState extends Equatable {
  //const TesisState();

  @override
  List<Object> get props => [];
}

final class TesisInitial extends TesisState {}

final class TesisLoading extends TesisState {}

final class TesisSuccessful extends TesisState {
  final List<TesisModel> tesis;

  TesisSuccessful({required this.tesis});
}

final class TesisFailure extends TesisState {
  final String message;

  TesisFailure({required this.message});
}
