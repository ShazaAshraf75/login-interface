import 'package:flutter/material.dart';
import 'package:login_interface/theme/colors.dart';

class DFMSwidget extends StatelessWidget {
  const DFMSwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.30,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
              darkPurpleColor,
              redColor,
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
