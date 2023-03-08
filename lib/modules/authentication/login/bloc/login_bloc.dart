// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_interface/constants/constants.dart';
import 'package:login_interface/models/login_model.dart';
import 'package:login_interface/modules/authentication/login/bloc/login_events.dart';
import 'package:login_interface/modules/authentication/widgets/custom_alert_dialog.dart';
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
  Future _onUserLoggedInEvent(
      UserLoggedInEvent event, Emitter<LoginStates> emit) async {
    if (event.username.isEmpty) {
      emit(UsernameIsEmptyState());
    } else if (event.password.isEmpty) {
      emit(PasswordIsEmptyState());
    } else {
      emit(LoginLoadingState());
      await DioHelper.postData(url: EndPoints.login, data: {
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
      }).catchError((error, context) {
        print(error.toString());
        showDialog(
          context: context,
          builder: (_) => const CustomAlertDialog(),
          barrierDismissible: false,
        );
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
