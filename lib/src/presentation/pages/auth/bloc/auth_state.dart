part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

final class AuthStateUnLogged extends AuthState {}

final class AuthStateLoading extends AuthState {}

final class AuthStateLogged extends AuthState {}

final class AuthStateFailure extends AuthState {
  final String message;
  AuthStateFailure({required this.message});
}
