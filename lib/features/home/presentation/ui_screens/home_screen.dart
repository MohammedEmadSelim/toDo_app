import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/constants/icons_constants.dart';
import 'package:to_do_app/core/responsive/responsive_extention.dart';
import 'package:to_do_app/core/themes/app_colores.dart';
import 'package:to_do_app/core/utiles/widgets/custom_field.dart';
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
                  separatorBuilder: (context, index) => SizedBox(
                    height: 2.h,
                  ),
                  itemCount: 2,
                  itemBuilder: (context, index) => Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                    height: 22.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: AppColors.pink,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              bottom: 4.h,
              right: 2.w,
              child: Column(
                children: [
                  TapEffect(
                    onClick: () {},
                    child: CircleAvatar(
                      radius: 3.h,
                      backgroundColor: AppColors.pink,
                      child: SvgPicture.asset(IconsConstants.themeIcon),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  TapEffect(
                    onClick: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => AddToDoWidget(),
                      );
                    },
                    child: CircleAvatar(
                      radius: 3.h,
                      backgroundColor: AppColors.pink,
                      child: SvgPicture.asset(IconsConstants.add),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddToDoWidget extends StatelessWidget {
  AddToDoWidget({
    super.key,
  });

  TextEditingController controller = TextEditingController();
  TextEditingController desController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColors.lightPink,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            CustomTextFormField(
              titleColor: AppColors.white,
              controller: controller,
              hint: 'title'.tr(),
              color: AppColors.white,
            ),
            SizedBox(
              height: 1.h,
            ),
            CustomTextFormField(
              maxLines: 2.h.toInt(),
              titleColor: AppColors.white,
              controller: desController,
              hint: 'description'.tr(),
              color: AppColors.white,
            ),
            SizedBox(
              height: 1.h,
            ),
            // ElevatedButton(
            //     onPressed: () async {
            //       final DateTime? date = await showDatePicker(
            //         context: context,
            //         firstDate: DateTime(2000),
            //         lastDate: DateTime(2100),
            //         initialDate: DateTime.now()
            //       );
            //     },
            //     child: CustomText(data: 'date picker'))
            DateWidget()
          ],
        ),
      ),
    );
  }
}

class DateWidget extends StatefulWidget {
  const DateWidget({super.key});

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  String dateTitle = 'deadline_optional'.tr();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.5.h,
      decoration: BoxDecoration(
          color: AppColors.lightPink,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.white)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              data: dateTitle,
              color: AppColors.white,
            ),
            IconButton(
                onPressed: () async {
                  final DateTime? date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                      initialDate: DateTime.now());
                  setState(() {
                    if(date != null){
                      dateTitle =DateFormat('dd MMMM yyyy').format(date);
                    }
                  });
                },
                icon: Icon(Icons.calendar_today_outlined,color: AppColors.white,))
          ],
        ),
      ),
    );
  }
}
