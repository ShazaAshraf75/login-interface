// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_interface/modules/survey/shared/navigation/bloc/navigation_bloc.dart';
import 'package:login_interface/modules/survey/shared/navigation/bloc/navigation_events.dart';
import 'package:login_interface/modules/survey/shared/navigation/bloc/navigation_sates.dart';
import 'package:login_interface/theme/color_manager.dart';
import 'package:login_interface/utils/resources/image_paths.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationStates>(
        builder: (context, state) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            fixedColor: ColorManager.darkPurpleColor,
            currentIndex: BlocProvider.of<NavigationBloc>(context).currentIndex,
            onTap: (index) {
              BlocProvider.of<NavigationBloc>(context)
                  .add(BottomNavBarChangedEvent(index));
            },
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(ImagePaths.unselected_dashboard),
                  activeIcon: SvgPicture.asset(ImagePaths.selected_dashboard),
                  label: "Dashboard"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(ImagePaths.unselected_myShops),
                  activeIcon: SvgPicture.asset(ImagePaths.selected_myShops),
                  label: "My Tasks"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(ImagePaths.unselected_myTasks),
                  activeIcon: SvgPicture.asset(ImagePaths.selected_myTasks),
                  label: "My Shops"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(ImagePaths.unselected_offlineTasks),
                  activeIcon:
                      SvgPicture.asset(ImagePaths.selected_offlineTasks),
                  label: "Offline Tasks"),
            ]),
        body: BlocProvider.of<NavigationBloc>(context)
            .screens[BlocProvider.of<NavigationBloc>(context).currentIndex],
      );
    });
  }
}
