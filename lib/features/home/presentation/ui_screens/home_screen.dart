import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/responsive/responsive_extention.dart';
import 'package:to_do_app/core/themes/app_colores.dart';
import 'package:to_do_app/features/home/presentation/components/custome_home_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SafeArea(
          child: Column(
            children: [
              CustomHomeAppBar(),
              SizedBox(height: 7.h),
              Expanded(
                child: ListView.separated(
                  itemBuilder:
                      (context, index) => Container(
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: AppColors.bink,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Design UI App',
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 35.w),
                                  Container(
                                    child: SvgPicture.asset(
                                      'assets/Icons/clock.svg',
                                    ),
                                    height: 6.h,
                                    width: 6.w,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 7.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Make To-DO UI Design for  NTI .',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Created at 1 Sept 2021',
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(height: 2.h),
                  itemCount: 2,
                ),
              ),
              SizedBox(height: 2.h),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        minRadius: 3.h,
                        maxRadius: 4.h,
                        backgroundColor: AppColors.bink,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: .25.h,
                              left: 2.w,
                              child: SvgPicture.asset(
                                'assets/Icons/Vector.svg',
                                height: 10.h,
                              ),
                            ),
                            Positioned(
                              child: SvgPicture.asset(
                                'assets/Icons/Vector-1.svg',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        minRadius: 4.h,
                        maxRadius: 5.h,
                        backgroundColor: AppColors.bink,
                        child: Stack(
                          children: [
                            Positioned(
                              child: SvgPicture.asset(
                                'assets/Icons/Vector2.svg',
                              ),
                            ),
                            Positioned(
                              child: SvgPicture.asset(
                                'assets/Icons/Vector3.svg',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
