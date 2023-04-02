// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_interface/modules/authentication/login/bloc/login_bloc.dart';
import 'package:login_interface/modules/authentication/login/bloc/observer.dart';
import 'package:login_interface/modules/authentication/login/login_screen.dart';
import 'package:login_interface/theme/theme.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: defaultTheme,
        home: LoginScreen(),
      ),
    );
  }
}
