// ignore_for_file: avoid_print

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/themes/app_colores.dart';
import 'package:to_do_app/core/utiles/widgets/button_login.dart';
import 'package:to_do_app/core/utiles/widgets/field_login.dart';
import 'package:to_do_app/features/auth/presentation/components/custom_app_bar.dart';
import 'package:to_do_app/features/auth/presentation/ui_screens/sign_in_screen.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // بدء الأنميشن بعد أول فريم
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
        reloadPage: ForgetPassScreen(),
      ),
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: _opacity,
          curve: Curves.easeIn,
          child: ListView(
            children: [
              const SizedBox(height: 10),
              Image.asset("assets/logo.png"),
              CustomTextField(
                labelText: 'password'.tr(),
                isPassword: true,
              ),
              CustomTextField(
                labelText: 'confirm_Password'.tr(),
                isPassword: true,
              ),
              const SizedBox(height: 5),
              ButtonLogin(
                text: "change_password".tr(),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                  );
                  print("CHANGE PASSWORD👌");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
