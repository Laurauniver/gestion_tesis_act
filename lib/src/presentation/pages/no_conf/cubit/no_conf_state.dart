part of 'no_conf_cubit.dart';

sealed class NoConformidadState extends Equatable {
  //const NoConformidadState();

  @override
  List<Object> get props => [];
}

final class NoConformidadInitial extends NoConformidadState {}

final class NoConformidadLoading extends NoConformidadState {}

final class NoConformidadSuccessful extends NoConformidadState {
  final List<NoConformidadTableEntity> noConformidad;

  NoConformidadSuccessful({required this.noConformidad});
  
}

final class NoConformidadFailure extends NoConformidadState {
  final String message;

  NoConformidadFailure({required this.message});
}
