import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui/components/component.dart';
import 'package:ui/constants/colors.dart';
import 'package:ui/screens/ui_1/sign_up/sign_up_screen.dart';
import 'package:ui/screens/ui_1/welcome/background.dart';

import '../login/login_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Background(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'WELCOME TO EDU',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            SvgPicture.asset(
              'assets/icons/chat.svg',
              height: size.height * 0.45,
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            clickButton(
              text: 'login',
              textColor: Colors.white,
              backgroundColor: primaryColor,
              width: size.width * 0.55,
              function: () {
                navigateTo(
                  context,
                  LoginScreen(),
                );
              },
            ),
            const SizedBox(
              height: 13,
            ),
            clickButton(
              text: 'signup',
              textColor: Colors.black,
              backgroundColor: primaryLightColor,
              width: size.width * 0.55,
              function: () {
                navigateTo(
                    context,
                    SignUpScreen(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
