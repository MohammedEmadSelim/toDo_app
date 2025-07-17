import 'package:flutter/material.dart';
import 'package:to_do_app/core/themes/app_colores.dart';

class LanguageSwitch extends StatelessWidget {
  final bool isArabic;
  final ValueChanged<bool> onChanged;

  const LanguageSwitch({
    super.key,
    required this.isArabic,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            "EN",
            style: TextStyle(color: AppColores().textColor, fontSize: 17),
          ),
        ),
        Switch(
          value: isArabic,
          onChanged: onChanged,
          activeColor: AppColores().background,
          activeTrackColor: AppColores().grean,
          inactiveThumbColor: AppColores().background,
          inactiveTrackColor: AppColores().pink,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(
            "AR",
            style: TextStyle(color: AppColores().textColor, fontSize: 17),
          ),
        ),
      ],
    );
  }
}
