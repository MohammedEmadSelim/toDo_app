import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/core/responsive/responsive_extention.dart';
import 'package:to_do_app/core/themes/app_colores.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [SvgPicture.asset('assets/Icons/rafiki.svg')],
            ),
            SizedBox(height: 7.h),
            profileItemRow(hint: 'Name'),
            SizedBox(height: 3.h),
            profileItemRow(hint: 'Change Email'),
            SizedBox(height: 3.h),
            profileItemRow(hint: 'Change Password'),
            SizedBox(height: 3.h),
            profileItemRow(hint: 'Change Language'),
            SizedBox(height: 7.h),
            Row(
              children: [
                Text(
                  'Log Out',
                  style: TextStyle(
                    color: AppColors.bink,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class profileItemRow extends StatelessWidget {
  const profileItemRow({super.key, required this.hint});
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(hint),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ],
    );
  }
}
