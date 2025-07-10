import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/constants/icons_constants.dart';
import 'package:to_do_app/core/responsive/responsive_extention.dart';
import 'package:to_do_app/core/themes/app_colores.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField(
      {super.key, required this.controller, required this.hint,  this.isPassword=false});

  final TextEditingController controller;
  final String hint;
  final bool? isPassword;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      obscureText: isVisible,
      keyboardType: TextInputType.visiblePassword,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon:
            widget.isPassword!? GestureDetector(
               onTap: () {
                 isVisible =!isVisible;
                 setState(() {
                 });
               },
               child: SvgPicture.asset(
               isVisible? IconsConstants.visible:IconsConstants.unVisible,
                height: 1.h,
                fit: BoxFit.none,
                           ),
             ):null,
        hintText: widget.hint,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.grey,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.grey, // Optional: change as needed
            width: 1,
          ),
        ),
      ),
    );
  }
}
