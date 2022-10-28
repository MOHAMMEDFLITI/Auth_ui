import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui/components/component.dart';
import 'package:ui/constants/colors.dart';
import 'package:ui/screens/ui_1/login/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
              left: 0,
              child: Image.asset(
                'assets/images/main_bottom.png',
                color: Colors.deepPurpleAccent[100],
                width: size.width * 0.15,
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'SIGNUP',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.07,
                  ),
                  SvgPicture.asset(
                    'assets/icons/signup.svg',
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
                    text: 'signup',
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
                        "Already have an account ?",
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
                            LoginScreen(),
                          );
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height *0.02,
                  ),
                  Row(
                    children:
                    const [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 35,
                          ),
                          child: Divider(
                            color: primaryLightColor,
                            height: 5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8
                        ),
                        child: Text(
                          'OR',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 35,
                          ),
                          child: Divider(
                            color: primaryLightColor,
                            height: 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height *0.013,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      InkWell(
                        onTap:(){},
                        borderRadius: BorderRadius.circular(22),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          radius: 20,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 18,
                            child: SvgPicture.asset(
                              'assets/icons/twitter.svg',
                              color: primaryColor,
                              height: 25,
                              width: 6,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: InkWell(
                          onTap: (){},
                          borderRadius: BorderRadius.circular(22),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            radius: 20,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 18,
                              child: SvgPicture.asset(
                                'assets/icons/google-plus.svg',
                                color: primaryColor,
                                width: 20,
                                height: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){},
                        borderRadius: BorderRadius.circular(22),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          radius: 20,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 18,
                            child: SvgPicture.asset(
                              'assets/icons/facebook.svg',
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
