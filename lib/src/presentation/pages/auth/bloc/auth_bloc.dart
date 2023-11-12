// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gestion_tesis/src/domain/repositories/auth_repository_imp.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this.authRepository,
  ) : super(const AuthState()) {
    on<OnLoginEvent>(_onLogin);
    on<OnCheckLoginEvent>(_onCheckLogin);
    on<OnLogOutEvent>(_onLogOut);
  }

  final AuthRepository authRepository;

  Future<void> _onLogin(OnLoginEvent event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());

    final response = authRepository.authentication(event.user, event.password);

    if (response == true) {
      emit(SuccessfulAuthState());
    } else {
      emit(
        const FailureAuthState(
            "Por favor, verifique que el usuario y/o la contraseña sean correctos"),
      );
    }
  }

  FutureOr<void> _onLogOut(OnLogOutEvent event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());
    await authRepository.logout();
  }

  FutureOr<void> _onCheckLogin(
      OnCheckLoginEvent event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());

    final bool response = await authRepository.checkLogin();

    if (response == true) {
      emit(const AuthState(isAuth: true));
    } else {
      emit(const AuthState(isAuth: false));
    }
  }
}
