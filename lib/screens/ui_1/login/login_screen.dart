import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui/components/component.dart';
import 'package:ui/constants/colors.dart';
import 'package:ui/screens/ui_1/sign_up/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isPass =false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/signup_top.png',
                color: Colors.deepPurpleAccent,
                width: size.width * 0.3,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                'assets/images/login_bottom.png',
                color: Colors.deepPurpleAccent[100],
                width: size.width * 0.3,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'LOGIN',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.07,
                ),
                SvgPicture.asset(
                  'assets/icons/login.svg',
                  height: size.height * 0.39,
                ),
                SizedBox(
                  height: size.height * 0.06,
                ),
                defaultTextFormField(
                  text: 'Email Address',
                  prefixIcon: Icons.email_outlined,
                  width: size.width * 0.57,
                ),
                const SizedBox(
                  height: 13,
                ),
                defaultTextFormField(
                  text: 'Password',
                  prefixIcon: Icons.lock_outlined,
                  width: size.width * 0.57,
                  isPassword: isPass,
                  suffixIcon: isPass ? Icons.visibility_outlined :Icons.visibility_off_outlined,
                  changePass: ()
                  {
                    setState(()
                    {
                      isPass = !isPass;
                    });
                  },
                ),
                const SizedBox(
                  height: 13,
                ),
                clickButton(
                  text: 'login',
                  textColor: Colors.white,
                  backgroundColor: primaryColor,
                  width: size.width * 0.57,
                ),
                SizedBox(
                  height: size.height *0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account ?",
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: ()
                      {
                        navigateTo(
                            context,
                          SignUpScreen(),
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
