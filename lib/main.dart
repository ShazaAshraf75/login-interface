// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_interface/modules/authentication/login/bloc/login_bloc.dart';
import 'package:login_interface/modules/authentication/login/bloc/observer.dart';
import 'package:login_interface/modules/authentication/login/login_screen.dart';
import 'package:login_interface/modules/survey/shared/navigation/bloc/navigation_bloc.dart';
import 'package:login_interface/theme/theme.dart';
import 'package:login_interface/utils/network/dio_helper.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => NavigationBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: defaultTheme,
        home: LoginScreen(),
      ),
    );
  }
}
