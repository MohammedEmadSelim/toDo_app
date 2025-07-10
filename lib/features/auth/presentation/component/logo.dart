import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/core/responsive/responsive_extention.dart';
import 'package:to_do_app/core/themes/app_colores.dart';

class logo extends StatelessWidget {
  const logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            SvgPicture.asset('assets/Icons/mobile_tech.svg'),
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
        color: AppColors.pink,
        fontWeight: FontWeight.w900,
        fontSize: 35,
      ),
    );
  }
}
