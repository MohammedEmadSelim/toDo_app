import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/constants/icons_constants.dart';
import 'package:to_do_app/core/responsive/responsive_extention.dart';
import 'package:to_do_app/core/themes/app_colores.dart';
import 'package:to_do_app/core/utiles/widgets/custom_text.dart';
import 'package:to_do_app/core/utiles/widgets/tap_effect.dart';
import 'package:to_do_app/features/home/presentation/components/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                CustomHomeAppBar(),
                Center(
                  child: CustomText(data: 'Home screen'),
                ),
                Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(
                            height: 2.h,
                          ),
                      itemCount: 2,
                      itemBuilder: (context, index) =>
                          Container(
                            padding:
                            EdgeInsets.symmetric(
                                horizontal: 3.w, vertical: 1.h),
                            height: 22.h,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            decoration: BoxDecoration(
                                color: AppColors.bink,
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    CustomText(
                                      data: 'Design UI App',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: AppColors.white,
                                    ),
                                    SvgPicture.asset(IconsConstants.clock)
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      CustomText(
                                        data: 'Make To-DO UI Design for  NTI .',
                                        color: AppColors.white,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      data: 'Created at 1 Sept 2021',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                    ))
              ],
            ),
            Positioned(
                bottom:4.h,
                right:2.w,
                child: Column(
                  children: [
                    TapEffect(
                      onClick: () {

                      },
                      child: CircleAvatar(
                        radius: 3.h,
                        backgroundColor: AppColors.bink,
                        child: SvgPicture.asset(IconsConstants.themeIcon),

                      ),
                    ),
                    SizedBox(height: 1.h,),
                    TapEffect(
                      onClick: () {

                      },
                      child: CircleAvatar(
                        radius: 3.h,
                        backgroundColor: AppColors.bink,
                        child: SvgPicture.asset(IconsConstants.add),

                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
