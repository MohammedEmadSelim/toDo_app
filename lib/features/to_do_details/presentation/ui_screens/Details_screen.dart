import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/core/responsive/responsive_extention.dart';
import 'package:to_do_app/core/themes/app_colores.dart';
import 'package:to_do_app/core/utiles/widgets/custom_field.dart';
import 'package:to_do_app/core/utiles/widgets/custom_text.dart';
import 'package:to_do_app/core/utiles/widgets/tap_effect.dart';
import 'dart:ui';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(icon: Icon(Icons.access_time), onPressed: () {}),
          IconButton(
            icon: Icon(Icons.mode_edit_rounded),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                isScrollControlled: true,
                builder: (context) => EditToDoWidet(),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete_outline),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                //clipBehavior: Clip.antiAliasWithSaveLayer,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                // builder: (context) => deleteToDoWidet(),
                builder: (context) {
                  return BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.only(top: 100),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                        ),
                      ),
                      child: DeleteToDoWidget(),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(5.w),
        child: Column(
          children: [
            SizedBox(height: 2.h),
            Row(
              children: [
                Text(
                  'Design UI App',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 3.h),
            Row(
              children: [
                Text(
                  'Make To-DO UI Design for  NTI .',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            Row(
              children: [Text('Design List :', style: TextStyle(fontSize: 17))],
            ),
            SizedBox(height: 2.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  const Text(
                    '• login\n• register\n• home\n• detail\n• add\n• edit\n',
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Created at 1 Sept 2021', style: TextStyle(fontSize: 17)),
              ],
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}

class EditToDoWidet extends StatelessWidget {
  EditToDoWidet({super.key});
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
                          todayBackgroundColor: WidgetStateProperty.all(
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
                          todayBackgroundColor: WidgetStateProperty.all(
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

class DeleteToDoWidget extends StatelessWidget {
  DeleteToDoWidget({super.key});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(data: 'Delete TODO'),
          ),
          SizedBox(height: 2.h),
          CustomButton(data: 'Cancel'),
          SizedBox(height: 4.h),
        ],
      ),
    );
  }
}
