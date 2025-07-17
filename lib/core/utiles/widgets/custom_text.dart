import 'package:flutter/material.dart';
import 'package:to_do_app/core/themes/app_colores.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key, required this.data, this.fontSize, this.fontWeight, this.color, this.overflow, this.maxLines});

  final String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      data,
      style: TextStyle(

        overflow:overflow ,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: fontSize ?? 14.0,
        height: 1.7,
        letterSpacing: 0.0,
        color: color??AppColors.grey,
      ),
    );
  }
}
