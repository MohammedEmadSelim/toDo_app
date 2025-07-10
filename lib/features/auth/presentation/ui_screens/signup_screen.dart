import 'package:flutter/material.dart';

import 'package:to_do_app/core/responsive/responsive_extention.dart';
import 'package:to_do_app/core/themes/app_colores.dart';
import 'package:to_do_app/core/utiles/widgets/custom_button.dart';
import 'package:to_do_app/core/utiles/widgets/custom_field.dart';
import 'package:to_do_app/features/auth/presentation/component/logo.dart';
import 'package:to_do_app/features/auth/presentation/ui_screens/login_screen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
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
            SizedBox(
              height: 10.h,
            ),
            logo(),
            SizedBox(
              height: 7.h,
            ),
            CustomTextFormField(
              controller: emailController,
              hint: 'Email',
              isPassword: false,
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextFormField(
              controller: fullNameController,
              hint: 'Full Name',
              isPassword: false,
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextFormField(
              controller: passwordController,
              hint: 'password',
              isPassword: true,
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextFormField(
              controller: confirmPasswordController,
              hint: 'Confirm Password',
              isPassword: true,
            ),
            SizedBox(
              height: 3.h,
            ),
            CustomButton(
              haint: 'Sign Up',
              screen: LoginScreen(),
            ),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Have an account?',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 5),
                GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      ' Log in',
                      style: TextStyle(
                          color: AppColors.pink,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )),
              ],
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}
