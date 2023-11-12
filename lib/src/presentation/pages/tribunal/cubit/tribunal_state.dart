part of 'tribunal_cubit.dart';

sealed class TribunalState extends Equatable {
 // const TribunalState();

  @override
  List<Object> get props => [];
}

final class TribunalInitial extends TribunalState {}

final class TribunalLoading extends TribunalState{}

final class TribunalSuccessful extends TribunalState{
  final List<TribunalTableEntity> tribunal;

  TribunalSuccessful({required this.tribunal});


}

final class TribunalFailure extends TribunalState{
  final String message;

  TribunalFailure({required this.message});

}
