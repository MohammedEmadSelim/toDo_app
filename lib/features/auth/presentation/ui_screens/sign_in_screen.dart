// ignore_for_file: avoid_print

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/themes/app_colores.dart';
import 'package:to_do_app/core/utiles/widgets/button_login.dart';
import 'package:to_do_app/core/utiles/widgets/field_login.dart';
import 'package:to_do_app/features/auth/presentation/custom_app_bar.dart';
import 'package:to_do_app/features/auth/presentation/ui_screens/forget_pas_screen.dart';
import 'package:to_do_app/features/auth/presentation/ui_screens/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  double _opacity = 0.0;
  bool isArabic = false;

  @override
  void initState() {
    super.initState();

    // بدء أنميشن الشفافية
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColores().background,
      appBar: CustomAppBar(
        reloadPage: SignInScreen(),
      ),
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: _opacity,
          curve: Curves.easeIn,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Image.asset("assets/logo.png"),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                CustomTextField(
                  labelText: 'email',
                  keyboardType: TextInputType.emailAddress,
                ),
                CustomTextField(
                  labelText: 'password',
                  isPassword: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgetPassScreen()),
                        );
                      },
                      child: Text(
                        "forgot_Password?".tr(),
                        style: TextStyle(color: AppColores().textColor),
                      ),
                    )
                  ],
                ),
                ButtonLogin(
                    text: "sign_in",
                    onPressed: () {
                      print("SIGN IN👌");
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "don't_have_an_account?".tr(),
                      style: TextStyle(color: AppColores().textColor),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()),
                        );
                      },
                      child: Text(
                        "sign_up".tr(),
                        style: TextStyle(color: AppColores().mainColor),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
