import 'package:flutter/material.dart';
import 'package:to_do_app/core/themes/app_colores.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.haint,
    required this.screen,
  });

  final String haint;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    String h = this.haint;
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: AppColors.pink,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            '$h',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
