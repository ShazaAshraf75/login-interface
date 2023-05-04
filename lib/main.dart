import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_interface/data/data_source/local/shared_prefrences/cache_helper.dart';
import 'package:login_interface/modules/authentication/login/bloc/login_bloc.dart';
import 'package:login_interface/modules/authentication/login/bloc/observer.dart';
import 'package:login_interface/modules/authentication/login/login_screen.dart';
import 'package:login_interface/modules/survey/my_shops/bloc/shops_bloc.dart';
import 'package:login_interface/modules/survey/shared/navigation/bloc/navigation_bloc.dart';
import 'package:login_interface/theme/theme.dart';
import 'package:login_interface/utils/network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        BlocProvider(
          create: (context) => ShopsBloc(),
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
