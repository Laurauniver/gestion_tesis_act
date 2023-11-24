// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestion_tesis/src/domain/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this.authRepository,
  ) : super(AuthStateUnLogged()) {
    on<OnLoginEvent>(_onLogin);
    on<OnCheckLoginEvent>(_onCheckLogin);
    on<OnLogOutEvent>(_onLogOut);
  }

  final AuthRepository authRepository;

  Future<void> _onLogin(OnLoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthStateLoading());

    final response = authRepository.authentication(event.user, event.password);

    if (response == true) {
      emit(AuthStateLogged());
    } else {
      emit(
        AuthStateFailure(
            message:
                "Por favor, verifique que el usuario y/o la contraseña sean correctos"),
      );
    }
  }

  FutureOr<void> _onLogOut(OnLogOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthStateLoading());
    await authRepository.logout();
    emit(AuthStateUnLogged());
  }

  FutureOr<void> _onCheckLogin(
      OnCheckLoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthStateLoading());

    final bool response = await authRepository.checkLogin();

    if (response == true) {
      emit(AuthStateLogged());
    } else {
      emit(AuthStateUnLogged());
    }
  }
}
