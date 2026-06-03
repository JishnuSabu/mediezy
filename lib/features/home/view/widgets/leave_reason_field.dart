import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_task/core/constants/app_colors.dart';

class LeaveReasonField extends StatelessWidget {
  final TextEditingController? controller;

  const LeaveReasonField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 2,
      style: TextStyle(fontSize: 13.sp, color: AppColors.black , decoration: TextDecoration.none, ),
      decoration: InputDecoration(
        hintText: 'Enter Leave reason',
        hintStyle: TextStyle(fontSize: 13.sp, color: AppColors.lightGrey),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.w),
          borderSide: BorderSide(color:AppColors.lightGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.w),
          borderSide: BorderSide(color: AppColors.lightGrey),
        ),
      ),
    );
  }
}
