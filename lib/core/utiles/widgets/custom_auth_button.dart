import 'package:flutter/material.dart';
import 'package:to_do_app/core/responsive/responsive_extention.dart';
import 'package:to_do_app/core/themes/app_colores.dart';
import 'package:to_do_app/core/utiles/widgets/custom_text.dart';
import 'package:to_do_app/core/utiles/widgets/tap_effect.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.data, required this.onTap, this.color, this.hintColor});

  final String data;
  final Function() onTap;
  final Color? color;
  final Color? hintColor;

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      onClick: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width - 5.w,
        height: 4.h,
        decoration: BoxDecoration(
          color:color?? AppColors.pink,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: CustomText(
            color: hintColor??AppColors.white,
            data: data,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
