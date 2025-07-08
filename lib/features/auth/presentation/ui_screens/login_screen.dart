import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/responsive/responsive_extention.dart';
import 'package:to_do_app/core/themes/app_colores.dart';
import 'package:to_do_app/core/utiles/widgets/custom_field.dart';

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
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        HeadLineText(
                          data: 'T',
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        HeadLineText(
                          data: 'O',
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        HeadLineText(
                          data: 'D',
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        HeadLineText(
                          data: 'O',
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        HeadLineText(
                          data: 'L',
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        HeadLineText(
                          data: 'I',
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 5.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/icons/mobile_tech.svg'),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        HeadLineText(
                          data: 'S',
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        HeadLineText(
                          data: 'T',
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 7.h,
            ),
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
            ),
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
