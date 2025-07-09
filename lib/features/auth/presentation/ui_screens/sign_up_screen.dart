import 'package:flutter/material.dart';
import 'package:to_do_app/core/themes/app_colores.dart';
import 'package:to_do_app/core/utiles/widgets/button_login.dart';
import 'package:to_do_app/core/utiles/widgets/field_login.dart';
import 'package:to_do_app/features/auth/presentation/ui_screens/sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColores().background,
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Image.asset("assets/logo.png"),
            CustomTextField(
              labelText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            CustomTextField(
              labelText: 'Full Name',
              keyboardType: TextInputType.emailAddress,
            ),
            CustomTextField(
              labelText: 'Password',
              isPassword: true,
            ),
            CustomTextField(
              labelText: 'Confirm Password',
              isPassword: true,
            ),
            ButtonLogin(
                text: "SIGN UP",
                onPressed: () {
                  print("SIGN UP👍");
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Have an account?",
                  style: TextStyle(color: AppColores().textColor),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()),
                    );
                  },
                  child: Text(
                    "Log in",
                    style: TextStyle(color: AppColores().mainColor),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
