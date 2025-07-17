import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/constants/icons_constants.dart';
import 'package:to_do_app/core/responsive/responsive_extention.dart';
import 'package:to_do_app/core/themes/app_colores.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField(
      {super.key,
      required this.controller,
      required this.hint,
      this.isPassword = false,
      this.keyboardType,
      this.validators,
      this.color,
      this.titleColor, this.maxLines});

  final TextEditingController controller;
  final String hint;
  final bool? isPassword;
  final TextInputType? keyboardType;
  final String? Function(String?)? validators;
  final Color? color;
  final Color? titleColor;
  final int? maxLines;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      maxLines: widget.maxLines,
      cursorColor: widget.titleColor ?? AppColors.grey,
      style: TextStyle(color: widget.titleColor ?? AppColors.grey),
      validator: widget.validators,
      obscureText: isVisible,
      keyboardType: widget.keyboardType ?? TextInputType.visiblePassword,
      controller: widget.controller,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: widget.titleColor ?? AppColors.grey),
        suffixIcon: widget.isPassword!
            ? GestureDetector(
                onTap: () {
                  isVisible = !isVisible;
                  setState(() {});
                },
                child: SvgPicture.asset(
                  isVisible ? IconsConstants.visible : IconsConstants.unVisible,
                  height: 1.h,
                  fit: BoxFit.none,
                ),
              )
            : null,
        hintText: widget.hint,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: widget.color ?? AppColors.grey,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: widget.color ?? AppColors.grey,
            width: 1,
          ),
        ),
      ),
    );
  }
}
