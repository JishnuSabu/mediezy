import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_task/core/common_widgets/custom_app_bar.dart';
import 'package:mediezy_task/core/common_widgets/custom_text.dart';
import 'package:mediezy_task/core/common_widgets/custom_textfield.dart';
import 'package:mediezy_task/core/constants/app_colors.dart';
import 'package:mediezy_task/features/home/view/widgets/attendance_history_list_view.dart';

class MyRouteScreen extends StatelessWidget {
  const MyRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: CustomAppBar(),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(
                      'My Route',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w900,
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      controller: TextEditingController(),
                      hint: "Search",
                      borderRadius: BorderRadius.circular(24.w),
                      borderClr: AppColors.primaryGreen,
                      borderWidth: 2,
                      showSuffix: true,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.h),
                    Expanded(child: AttendanceHistoryListView()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
