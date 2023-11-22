part of 'tesis_detail_cubit.dart';

sealed class TesisDetailState extends Equatable {
  @override
  List<Object> get props => [];
}

final class TesisDetailInitial extends TesisDetailState {}

final class TesisDetailLoading extends TesisDetailState {}

final class TesisDetailSuccessful extends TesisDetailState {
  final TesisModel tesis;

  TesisDetailSuccessful({required this.tesis});
}

final class TesisDetailFailure extends TesisDetailState {
  final String message;

  TesisDetailFailure({required this.message});
}
