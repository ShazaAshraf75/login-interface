import 'package:flutter/material.dart';
import 'package:login_interface/theme/color_manager.dart';

class DFMSwidget extends StatelessWidget {
  const DFMSwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: MediaQuery.of(context).size.height * 0.30,
      height: 250,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
              ColorManager.darkPurpleColor,
              ColorManager.redColor,
            ],
          )),
      child: const Center(
        child: Text(
          "DFMS",
          style: TextStyle(
              fontFamily: "MontserratB", color: Colors.white, fontSize: 45),
        ),
      ),
    );
  }
}
