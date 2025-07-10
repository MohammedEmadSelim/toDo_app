import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/themes/app_colores.dart';
import 'package:to_do_app/core/utiles/widgets/button_login.dart';
import 'package:to_do_app/core/utiles/widgets/field_login.dart';
import 'package:to_do_app/features/auth/presentation/ui_screens/sign_in_screen.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColores().background,
      appBar: AppBar(),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Image.asset("assets/logo.png"),
            CustomTextField(
              labelText: 'Password',
              isPassword: true,
            ),
            CustomTextField(
              labelText: 'confirm_Password'.tr(),
              isPassword: true,
            ),
            SizedBox(
              height: 5,
            ),
            ButtonLogin(
                text: "CHANGE PASSWORD",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInScreen()),
                  );
                  print("CHANGE PASSWORD👌");
                }),
          ],
        ),
      ),
    );
  }
}
