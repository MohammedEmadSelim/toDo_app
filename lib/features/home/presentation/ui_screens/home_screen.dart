import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/responsive/responsive_extention.dart';
import 'package:to_do_app/core/themes/app_colores.dart';
import 'package:to_do_app/core/utiles/widgets/custom_field.dart';
import 'package:to_do_app/core/utiles/widgets/custom_text.dart';
import 'package:to_do_app/core/utiles/widgets/tap_effect.dart';
import 'package:to_do_app/features/home/presentation/components/custome_home_appbar.dart';
import 'package:to_do_app/features/to_do_details/presentation/ui_screens/Details_screen.dart';

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
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 2.h),
                  CustomHomeAppBar(),
                  SizedBox(height: 7.h),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder:
                          (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(),
                                ),
                              );
                            },
                            child: Container(
                              height: 20.h,
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
                                          height: 6.h,
                                          width: 6.w,
                                          child: SvgPicture.asset(
                                            'assets/Icons/clock.svg',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 1.5.h),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                  ),
                                  SizedBox(height: 4.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8.0,
                                        ),
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
                          ),
                      separatorBuilder:
                          (context, index) => SizedBox(height: 2.h),
                      itemCount: 2,
                    ),
                  ),
                ],
              ),

              Positioned(
                bottom: 9.h,
                right: 0.w,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TapEffect(
                    onClick: () {},
                    child: CircleAvatar(
                      minRadius: 3.h,
                      maxRadius: 4.h,
                      backgroundColor: AppColors.bink,
                      child: SvgPicture.asset(
                        'assets/Icons/Theme.svg',
                        height: 10.h,
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 0.h,
                right: 0.w,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TapEffect(
                    onClick: () {
                      showModalBottomSheet(
                        context: context,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        isScrollControlled: true,
                        builder: (context) => AddToDoWidet(),
                      );
                    },
                    child: CircleAvatar(
                      minRadius: 3.h,
                      maxRadius: 4.h,
                      backgroundColor: AppColors.bink,
                      child: Icon(
                        Icons.add_rounded,
                        color: AppColors.white,
                        opticalSize: 1.h,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddToDoWidet extends StatelessWidget {
  AddToDoWidet({super.key});
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h,

      decoration: BoxDecoration(
        color: AppColors.lightbink,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          SizedBox(height: 2.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SvgPicture.asset('assets/Icons/Rectangle 18.svg')],
          ),
          
          SizedBox(height: 2.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: (12.0)),
            child: CustomTextFormField(
              colorx: AppColors.white,
              controller: TextEditingController(),
              hint: 'Design UI App',
              maxlienx: 1,
            ),
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: (12)),
            child: CustomTextFormField(
              maxlienx: 14,
              colorx: AppColors.white,
              controller: TextEditingController(),
              hint: 'Design UI App',
            ),
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: (12)),
            child: DateWidget(),
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: (12)),
            child: photoWidget(),
          ),
          SizedBox(height: 2.h),
          CustomButton(data: 'ADD TODO'),
        ],
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
      height: 6.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.white),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(data: dateTitle, color: AppColors.white),
            IconButton(
              onPressed: () async {
                final DateTime? date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  initialDate: DateTime.now(),
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        colorScheme: ColorScheme.light(
                          primary: Colors.pink,
                          surface: AppColors.bink, // ← دا المهم
                          onPrimary: Colors.white,
                          onSurface: Colors.white,
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                          ),
                        ),
                        datePickerTheme: DatePickerThemeData(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          dayStyle: TextStyle(color: Colors.white),
                          todayBackgroundColor: MaterialStateProperty.all(
                            Colors.pink.shade100,
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                setState(() {
                  if (date != null) {
                    dateTitle = DateFormat('dd MMMM yyyy').format(date);
                  }
                });
              },
              icon: Icon(Icons.calendar_today_outlined, color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class photoWidget extends StatefulWidget {
  const photoWidget({super.key});

  @override
  State<photoWidget> createState() => _photoWidgetState();
}

class _photoWidgetState extends State<photoWidget> {
  String dateTitle = 'deadline_optional'.tr();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.white),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(data: dateTitle, color: AppColors.white),
            IconButton(
              onPressed: () async {
                final DateTime? date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  initialDate: DateTime.now(),
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        colorScheme: ColorScheme.light(
                          primary: Colors.pink,
                          surface: AppColors.bink, 
                          onPrimary: Colors.white,
                          onSurface: Colors.white,
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                          ),
                        ),
                        datePickerTheme: DatePickerThemeData(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          dayStyle: TextStyle(color: Colors.white),
                          todayBackgroundColor: MaterialStateProperty.all(
                            Colors.pink.shade100,
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                setState(() {
                  if (date != null) {
                    dateTitle = DateFormat('dd MMMM yyyy').format(date);
                  }
                });
              },
              icon: Icon(Icons.photo_outlined, color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      onClick: () {},
      child: Container(
        width: MediaQuery.of(context).size.width - 5.w,
        height: 6.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: CustomText(
            color: AppColors.bink,
            data: data,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
