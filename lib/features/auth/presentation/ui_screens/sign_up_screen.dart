// ignore_for_file: avoid_print

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/responsive/responsive_extention.dart';
import 'package:to_do_app/core/themes/app_colores.dart';
import 'package:to_do_app/core/themes/svg_icon.dart';
import 'package:to_do_app/core/utiles/widgets/button_login.dart';
import 'package:to_do_app/core/utiles/widgets/field_login.dart';
import 'package:to_do_app/core/validator/app_validator.dart';
import 'package:to_do_app/features/auth/presentation/components/custom_app_bar.dart';
import 'package:to_do_app/features/auth/presentation/controllers/sign_up_cubit/sign_up_cubit.dart';
import 'package:to_do_app/features/auth/presentation/ui_screens/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // تشغيل الأنميشن بعد أول فريم
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
        backgroundColor: AppColores().background,
        appBar: CustomAppBar(
          reloadPage: SignUpScreen(),
        ),
        body: Center(
          child: AnimatedOpacity(
            duration: const Duration(seconds: 1), // مدة الأنميشن
            opacity: _opacity,
            curve: Curves.easeIn,
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: 5.h),
                    SvgPicture.asset(
                      SvgIcon.logo,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextField(
                      labelText: 'email'.tr(),
                      keyboardType: TextInputType.emailAddress,
                      validators: (value) => AppValidator.emailName(value),
                      controller: emailController,
                    ),
                    CustomTextField(
                      labelText: "full_name".tr(),
                      keyboardType: TextInputType.emailAddress,
                      validators: (value) =>
                          AppValidator.validateName(value ?? ''),
                      controller: fullNameController,
                    ),
                    CustomTextField(
                      labelText: "password".tr(),
                      isPassword: true,
                      validators: (value) =>
                          AppValidator.passwordValidation(value),
                      controller: passwordController,
                    ),
                    CustomTextField(
                      labelText: "confirm_Password".tr(),
                      isPassword: true,
                      validators: (value) =>
                          AppValidator.passwordConfirmValidation(
                              value, passwordController.text),
                      controller: confirmPasswordController,
                    ),
                    BlocConsumer<SignUpCubit, SignUpState>(
                      listener: (context, state) {
                        if (state is SignUpFailure) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                'Error',
                              ),
                              content: Text(state.message),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        return ButtonLogin(
                          text: "sign_up".tr(),
                          onPressed: () {
                            // if (formKey.currentState!.validate()) {
                            print('object');
                            context.read<SignUpCubit>().signUpWithFirebase(
                                emailController.text, passwordController.text);
                            // }
                            print("SIGN UP👍 press");
                          },
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "have_an_account?".tr(),
                          style: TextStyle(color: AppColores().textColor),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignInScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "sign_in".tr(),
                            style: TextStyle(color: AppColores().pink),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
