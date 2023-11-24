part of 'tribunal_detail_cubit.dart';

sealed class TribunalDetailState extends Equatable {
  @override
  List<Object> get props => [];
}

final class TribunalDetailInitial extends TribunalDetailState {}

final class TribunalDetailLoading extends TribunalDetailState {}

final class TribunalDetailSuccessful extends TribunalDetailState {
  final Tribunal tribunal;

  TribunalDetailSuccessful({required this.tribunal});
}

final class TribunalDetailFailure extends TribunalDetailState {
  final String message;

  TribunalDetailFailure({required this.message});
}


// @freezed
// class TribunalDetailState with _$TribunalDetailState {
//   const factory TribunalDetailState.initial() = _Initial;
// }
