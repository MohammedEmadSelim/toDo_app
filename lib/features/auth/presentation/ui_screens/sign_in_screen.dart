import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/themes/app_colores.dart';
import 'package:to_do_app/core/utiles/widgets/button_login.dart';
import 'package:to_do_app/core/utiles/widgets/field_login.dart';
import 'package:to_do_app/features/auth/presentation/ui_screens/forget_pas_screen.dart';
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
                    Navigator.pushReplacement(
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
                  context.setLocale(Locale('ar'));
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
                    Navigator.push(
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

            // test Buttons to translate lang

            ElevatedButton(
              onPressed: () {
                context.setLocale(Locale('ar'));
              },
              child: Text('Switch to Arabic'),
            ),
            ElevatedButton(
              onPressed: () {
                context.setLocale(Locale('en'));
              },
              child: Text('Switch to English'),
            ),
          ],
        ),
      ),
    );
  }
}
