// ignore: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_interface/constants/constants.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                height: 160,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Something went wrong!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorManager.redColor,
                        fontFamily: "MontserratS",
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Please try again later.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: MaterialButton(
                        height: 53,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        )),
                        color: ColorManager.darkPurpleColor,
                        textColor: Colors.white,
                        child: const Text(
                          "Ok",
                          style: TextStyle(
                            fontFamily: "MontserratS",
                            fontSize: 14,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 100,
                child: SvgPicture.asset(
                  ImagePaths.error,
                  height: 160,
                  width: 160,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ));
  }
}
