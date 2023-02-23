// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_interface/models/login_model.dart';
import 'package:login_interface/modules/authentication/login/bloc/login_events.dart';
import 'package:login_interface/network/dio_helper.dart';
import 'package:login_interface/network/end_points.dart';

import 'login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginBloc() : super(LoginInitialState()) {
    on<UserLoggedInEvent>(userLogin);
    on<PasswordVisibilityChangedEvent>(changePasswordVisibility);
    on<CheckboxValueChangedEvent>(changeCheckboxValue);
  }

  static LoginBloc get(context) => BlocProvider.of(context);

  late LoginModel loginModel;
  void userLogin(UserLoggedInEvent event, Emitter<LoginStates> emit) async{
    emit(LoginLoadingState());
   await DioHelper.postData(url: LOGIN, data: {
      "userid": 0,
      "ipaddress": "FUH0216913004222",
      "devicetoken": "testtokens",
      "osversion": "15.1",
      "AppVersion": "1",
      "devicetype": "iOS",
      "data": {"User_Name": event.username, "User_Password": event.password}
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      print("This is my username:${loginModel.data!.username}");
      emit(LoginSuccessState(loginModel: loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  bool obscure = false;
  void changePasswordVisibility(
    PasswordVisibilityChangedEvent event,
    Emitter<LoginStates> emit,
  ) {
    obscure = !obscure;
    emit(ChangePasswordVisibilityState());
  }

  bool isSelected = false;
  void changeCheckboxValue(
    CheckboxValueChangedEvent event,
    Emitter<LoginStates> emit,
  ) {
    isSelected = event.value;
    emit(ChangeCheckboxState());
  }
}
