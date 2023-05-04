import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_interface/modules/survey/dashboard/dashboard_screen.dart';
import 'package:login_interface/modules/survey/my_shops/my_shops_screen.dart';
import 'package:login_interface/modules/survey/my_tasks/my_tasks_screen.dart';
import 'package:login_interface/modules/survey/offline_tasks/offline_tasks_screen.dart';
import 'package:login_interface/modules/survey/shared/navigation/bloc/navigation_events.dart';
import 'package:login_interface/modules/survey/shared/navigation/bloc/navigation_sates.dart';

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc() : super(NavigationInitialState()) {
    on<BottomNavBarChangedEvent>(_onBottomNavBarChange);
  }
  int currentIndex = 0;
  List<Widget> screens = [
    const DashboardScreen(),
    const MyTasksScreen(),
    const MyShopsScreen(),
    const OfflineTasksScreen(),
  ];
  void _onBottomNavBarChange(
      BottomNavBarChangedEvent event, Emitter<NavigationStates> emit) {
    currentIndex = event.index;
    emit(ChangeBottomNavBarState());
  }
}
