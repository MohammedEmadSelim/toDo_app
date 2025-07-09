import 'package:flutter/material.dart';
import 'package:to_do_app/core/themes/app_colores.dart';
import 'package:to_do_app/core/utiles/widgets/button_login.dart';
import 'package:to_do_app/core/utiles/widgets/field_login.dart';
// import 'package:to_do_app/features/auth/presentation/ui_screens/forget_pas_screen.dart';
import 'package:to_do_app/features/auth/presentation/ui_screens/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
              labelText: 'Password',
              isPassword: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const ForgetPassScreen()),
                    // );
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: AppColores().textColor),
                  ),
                )
              ],
            ),
            ButtonLogin(
                text: "SIGN IN",
                onPressed: () {
                  print("SIGN IN👌");
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(color: AppColores().textColor),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
                    );
                  },
                  child: Text(
                    "Sign up",
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
