// ignore_for_file: avoid_print

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/core/responsive/responsive_extention.dart';
import 'package:to_do_app/core/themes/app_colores.dart';
import 'package:to_do_app/core/themes/svg_icon.dart';
import 'package:to_do_app/core/utiles/widgets/button_login.dart';
import 'package:to_do_app/core/utiles/widgets/field_login.dart';
import 'package:to_do_app/core/utiles/widgets/show_dialog.dart';
import 'package:to_do_app/core/validator/app_validator.dart';
import 'package:to_do_app/features/auth/presentation/components/custom_app_bar.dart';
import 'package:to_do_app/features/auth/presentation/controllers/sign_in_cubit/sign_in_cubit.dart';
import 'package:to_do_app/features/auth/presentation/ui_screens/forget_pas_screen.dart';
import 'package:to_do_app/features/home/ui_screens/home_page_screen.dart';
import 'package:to_do_app/features/auth/presentation/ui_screens/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  double _opacity = 0.0;
  bool isArabic = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    // بدء أنميشن الشفافية
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: Scaffold(
        backgroundColor: AppColores().background,
        appBar: CustomAppBar(
          reloadPage: SignInScreen(),
        ),
        body: Center(
          child: AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: _opacity,
            curve: Curves.easeIn,
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: 1.h),
                    SvgPicture.asset(
                      SvgIcon.logo,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    CustomTextField(
                      labelText: 'email',
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validators: (p0) => AppValidator.emailName(p0),
                    ),
                    CustomTextField(
                      labelText: 'password',
                      isPassword: true,
                      controller: passwordController,
                      validators: (p0) => AppValidator.passwordValidation(p0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgetPassScreen()),
                            );
                          },
                          child: Text(
                            "forgot_Password?".tr(),
                            style: TextStyle(color: AppColores().textColor),
                          ),
                        )
                      ],
                    ),
                    BlocConsumer<SignInCubit, SignInState>(
                      listener: (context, state) {
                        if (state is SignFailure) {
                          ErrorDialog(
                            title: "Errodddr",
                            message: "The email and password are incorrect.",
                            onConfirm: () {
                              Navigator.pop(context);
                            },
                          );
                        }
                        if (state is SignInState) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePageScreen(),
                            ),
                            (route) => false,
                          );
                        }
                      },
                      builder: (context, state) {
                        return ButtonLogin(
                            text: "sign_in",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<SignInCubit>().signInWIthFirebase(
                                    emailController.text,
                                    passwordController.text);
                              }
                              print("SIGN IN👌 press");
                            });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "don't_have_an_account?".tr(),
                          style: TextStyle(color: AppColores().textColor),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()),
                            );
                          },
                          child: Text(
                            "sign_up".tr(),
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
