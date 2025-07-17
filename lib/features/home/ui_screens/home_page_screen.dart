import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/core/responsive/responsive_extention.dart';
import 'package:to_do_app/core/themes/app_colores.dart';
import 'package:to_do_app/core/themes/svg_icon.dart';
import 'package:to_do_app/features/home/components/task_card.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 5.w,
              ),
              SvgPicture.asset(
                SvgIcon.phone,
                width: 10.w,
              ),
              SizedBox(
                width: 73.w,
              ),
              SvgPicture.asset(
                SvgIcon.persone,
                width: 7.w,
              ),
              SizedBox(
                width: 5.w,
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          TaskCard(
            title: 'Design UI App',
            description: 'Make To-DO UI Design for NTI.',
            date: '1 Sept 2021',
            color: AppColores().pink,
            isSelected: true,
          ),
          TaskCard(
            title: 'Make UI Design',
            description:
                'Make UI design for the mini project post figma link to the trello using ...',
            date: '1 Sept 2021',
            color: AppColores().lightPink,
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'customIcon',
            onPressed: () {
              // اكشن زر الايقونة
            },
            shape: CircleBorder(),
            backgroundColor: AppColores().pink, // لو حبيت لون الخلفية
            child: SvgPicture.asset(
              SvgIcon.theme,
            ),
          ),
          SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'addButton',
            backgroundColor: AppColores().pink,
            shape: CircleBorder(),
            onPressed: () {
              // اكشن زر +
            },
            child: Icon(Icons.add,
                size: 30, color: Colors.white), // انت مستخدم 4.h لكن يفضل 24
          ),
        ],
      ),

      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     SvgPicture.asset(
      //       SvgIcon.theme,
      //     ),
      //     SvgPicture.asset(SvgIcon.add)
      //   ],
      // ),
    );
  }
}
