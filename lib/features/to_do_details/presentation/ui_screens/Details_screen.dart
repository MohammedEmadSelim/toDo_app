import 'package:flutter/material.dart';
import 'package:to_do_app/core/responsive/responsive_extention.dart';

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
          IconButton(icon: Icon(Icons.mode_edit_rounded), onPressed: () {}),
          IconButton(icon: Icon(Icons.delete_outline), onPressed: () {}),
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
// login
// register
// home
// detail
// add
// edit
// delete
// profile