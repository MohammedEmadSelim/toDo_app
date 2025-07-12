import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            SvgPicture.asset("assets/logo.svg"),
            CustomTextField(
              labelText: 'email'.tr(),
              keyboardType: TextInputType.emailAddress,
            ),
            CustomTextField(
              labelText: "full_name".tr(),
              keyboardType: TextInputType.emailAddress,
            ),
            CustomTextField(
              labelText: "password".tr(),
              isPassword: true,
            ),
            CustomTextField(
              labelText: "confirm_Password".tr(),
              isPassword: true,
            ),
            ButtonLogin(
                text: "sign_up".tr(),
                onPressed: () {
                  print("SIGN UP👍");
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "have_an_account?".tr(),
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
                    "sign_in".tr(),
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
