
import 'package:flutter/material.dart';
import 'package:to_do_app/core/themes/app_colores.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField(
      {super.key, required this.controller, required this.hint});

  final TextEditingController controller;
  final String hint;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.remove_red_eye_rounded),
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