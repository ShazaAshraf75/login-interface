// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_interface/models/login_model.dart';
import 'package:login_interface/network/dio_helper.dart';
import 'package:login_interface/network/end_points.dart';

import 'login_states.dart';

class LoginBloc extends Cubit<LoginStates> {
  LoginBloc() : super(LoginInitialState());

  static LoginBloc get(context) => BlocProvider.of(context);
  late LoginModel loginModel;
  void userLogin({required String username, required String password}) {
    emit(LoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {
      "userid": 0,
      "ipaddress": "FUH0216913004222",
      "devicetoken": "testtokens",
      "osversion": "15.1",
      "AppVersion": "1",
      "devicetype": "iOS",
      "data": {"User_Name": username, "User_Password": password}
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      // print(loginModel.data);
      emit(LoginSuccessState(loginModel: loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  bool obscure = false;
  void changePasswordVisibility() {
    obscure = !obscure;
    emit(ChangePasswordVisibilityState());
  }

  bool isSelected = false;
  void changeCheckboxValue(value) {
    isSelected = value;
    emit(ChangeCheckboxState());
  }
}
