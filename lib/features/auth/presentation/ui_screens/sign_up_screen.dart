import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/responsive/responsive_extention.dart';
import 'package:to_do_app/core/themes/app_colores.dart';
import 'package:to_do_app/core/utiles/widgets/custom_field.dart';
import 'package:to_do_app/core/utiles/widgets/custom_text.dart';
import 'package:to_do_app/features/auth/presentation/components/custom_auth_button.dart';
import 'package:to_do_app/features/auth/presentation/components/logo.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            const Logo(),
            SizedBox(
              height: 2.h,
            ),
            CustomTextFormField(
                controller: fullNameController, hint: 'full_name'.tr()),
            SizedBox(
              height: 1.h,
            ),
            CustomTextFormField(
                controller: emailController, hint: 'email'.tr()),
            SizedBox(
              height: 1.h,
            ),
            CustomTextFormField(
              controller: passwordController,
              hint: 'password'.tr(),
              isPassword: true,
            ),
            SizedBox(
              height: 1.h,
            ),
            CustomTextFormField(
              controller: confirmPasswordController,
              hint: 'confirm_password'.tr(),
              isPassword: true,
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomAuthButton(
              data: 'sign_up',
              onTap: () {},
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                  child: CustomText(data: 'have_an_account'.tr()),
                  onPressed: () {},
                ),
                TextButton(
                  style: ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                  child: CustomText(
                    data: 'login'.tr(),
                    color: AppColors.bink,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ));
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('this is Dilag'),
                          content: Text('this is testing app dialog'),
                          actions: [
                            ElevatedButton(
                                onPressed: () {}, child: Text('confirm')),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'cancel',
                                style: TextStyle(color: Colors.red),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.red[300])),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text('show dial'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
