// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
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

  LoginRepository? loginRepository;
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
      LoginStates authenticationState = await loginRepository!
          .loginApi(username: event.username, password: event.password);
      emit(authenticationState);
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
