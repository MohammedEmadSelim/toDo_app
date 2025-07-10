import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/responsive/responsive_extention.dart';
import 'package:to_do_app/core/themes/app_colores.dart';
import 'package:to_do_app/core/utiles/widgets/custom_field.dart';
import 'package:to_do_app/core/utiles/widgets/custom_text.dart';
import 'package:to_do_app/features/auth/presentation/components/custom_auth_button.dart';
import 'package:to_do_app/features/auth/presentation/components/logo.dart';
import 'package:to_do_app/features/auth/presentation/ui_screens/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(
          children: [
            Logo(),
            CustomTextFormField(
              controller: emailController,
              hint: 'email',
            ),
            SizedBox(
              height: 3.h,
            ),
            CustomTextFormField(
              controller: passwordController,
              hint: 'password',
              isPassword: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {},
                    child: CustomText(data: 'forget_password'.tr()))
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomAuthButton(
              onTap: () {},
              data: 'sign_in'.tr(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                  child: CustomText(data: 'dont_have_an_account'.tr()),
                  onPressed: () {},
                ),
                TextButton(
                  style: ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                  child: CustomText(
                    data: 'sign_up'.tr(),
                    color: AppColors.bink,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


class HeadLineText extends StatelessWidget {
  const HeadLineText({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: AppColors.bink,
        fontWeight: FontWeight.w900,
        fontSize: 35,
      ),
    );
  }
}
