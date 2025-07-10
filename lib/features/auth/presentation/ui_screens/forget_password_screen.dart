import 'package:flutter/material.dart';
import 'package:to_do_app/core/responsive/responsive_extention.dart';
import 'package:to_do_app/core/utiles/widgets/custom_button.dart';
import 'package:to_do_app/core/utiles/widgets/custom_field.dart';
import 'package:to_do_app/features/auth/presentation/component/logo.dart';
import 'package:to_do_app/features/auth/presentation/ui_screens/login_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            logo(),
            SizedBox(height: 7.h),
            CustomTextFormField(
              controller: passwordController,
              hint: 'password',
              isPassword: true,
            ),
            SizedBox(height: 3.h),
            CustomTextFormField(
              controller: confirmPasswordController,
              hint: 'Confirm Password',
              isPassword: true,
            ),
            SizedBox(height: 4.h),
            CustomButton(haint: 'CHANGE PASSWORD', screen: LoginScreen()),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}
