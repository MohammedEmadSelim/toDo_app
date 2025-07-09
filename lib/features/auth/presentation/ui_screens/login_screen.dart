import 'package:flutter/material.dart';
import 'package:to_do_app/core/themes/app_colores.dart';
import 'package:to_do_app/core/utiles/widgets/field_loginScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColores().background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo.png"),
            CustomTextField(
              labelText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            CustomTextField(
              labelText: 'Password',
              isPassword: true,
            ),
          ],
        ),
      ),
    );
  }
}
