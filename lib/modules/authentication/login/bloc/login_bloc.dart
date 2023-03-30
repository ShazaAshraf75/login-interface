// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_interface/data/data_source/remote/api_key.dart';
import 'package:login_interface/models/login_model.dart';
import 'package:login_interface/modules/authentication/login/bloc/login_events.dart';
import 'package:login_interface/network/dio_helper.dart';

import 'login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginBloc() : super(LoginInitialState()) {
    on<UserLoggedInEvent>(_onUserLoggedInEvent);
    on<CheckboxValueChangedEvent>(_onCheckboxValueChangedEvent);
    on<UsernameValidatedEvent>(_onUsernameValidatedEvent);
    on<PasswordValidatedEvent>(_onPasswordValidatedEvent);
  }

  late LoginModel loginModel;
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
      await DioHelper.postData(url: ApiKey.login, data: {
        "userid": 0,
        "ipaddress": "FUH0216913004222",
        "devicetoken": "testtokens",
        "osversion": "15.1",
        "AppVersion": "1",
        "devicetype": "iOS",
        "data": {"User_Name": event.username, "User_Password": event.password}
      }).then((value) {
        loginModel = LoginModel.fromJson(value.data);
        emit(LoginSuccessState(loginModel: loginModel));
        if (state is LoginSuccessState) {
          if (loginModel.resultCode == 1) {
            emit(ValidToastState(loginModel: loginModel));
          } else {
            emit(InvalidToastState(loginModel: loginModel));
          }
        }
      }).catchError((error) {
        emit(LoginErrorState(error.toString()));
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
    CheckboxValueChangedEvent event,
    Emitter<LoginStates> emit,
  ) {
    var isSelected = event.value;
    emit(ChangeCheckboxState(isSelected: isSelected));
  }
}
