import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.isPassword = false,
    this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _hideText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _hideText : false,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          labelText: widget.labelText.tr(),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _hideText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                  onPressed: () {
                    setState(() {
                      _hideText = !_hideText;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
