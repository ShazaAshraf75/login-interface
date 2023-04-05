// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_interface/data/data_source/remote/api_key.dart';
import 'package:login_interface/data/data_source/remote/authentication_api/authentication_api_manager.dart';
import 'package:login_interface/data/data_source/remote/authentication_api/authentication_api_service.dart';
import 'package:login_interface/modules/authentication/login/bloc/login_events.dart';
import 'package:login_interface/modules/authentication/login/bloc/login_repository.dart';

import 'login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginBloc() : super(LoginInitialState()) {
    on<UserLoggedInEvent>(_onUserLoggedInEvent);
    on<CheckboxValueChangedEvent>(_onCheckboxValueChangedEvent);
    on<UsernameValidatedEvent>(_onUsernameValidatedEvent);
    on<PasswordValidatedEvent>(_onPasswordValidatedEvent);
  }

  LoginRepository loginRepository = LoginRepository(
      authenticationApiManager: AuthenticationApiManager(
          AuthenticationApiService(Dio(), baseUrl: ApiKey.baseUrl)));

  Future<void> _onUserLoggedInEvent(
      UserLoggedInEvent event, Emitter<LoginStates> emit) async {
    if (event.username.isEmpty && event.password.isEmpty) {
      emit(LoginFormIsEmptyState());
    } else if (event.username.isEmpty) {
      emit(UsernameIsEmptyState());
    } else if (event.password.isEmpty) {
      emit(PasswordIsEmptyState());
    } else {
      emit(LoginLoadingState());
      await loginRepository
          .loginApi(username: event.username, password: event.password)
          .then((value) {
        emit(value);
      }).then((value) {
        emit(LoginNotLoadingState());
      });
    }
  }

  void _onUsernameValidatedEvent(
      UsernameValidatedEvent event, Emitter<LoginStates> emit) {
    if (event.username.isEmpty) {
      emit(UsernameIsEmptyState());
    } else {
      emit(UsernameIsNotEmptyState());
    }
  }

  void _onPasswordValidatedEvent(
      PasswordValidatedEvent event, Emitter<LoginStates> emit) {
    if (event.password.isEmpty) {
      emit(PasswordIsEmptyState());
    } else {
      emit(PasswordIsNotEmptyState());
    }
  }

  void _onCheckboxValueChangedEvent(
      CheckboxValueChangedEvent event, Emitter<LoginStates> emit) {
    var isSelected = event.value;
    emit(ChangeCheckboxState(isSelected: isSelected));
  }
}
