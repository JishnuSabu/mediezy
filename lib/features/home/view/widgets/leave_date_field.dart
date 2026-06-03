import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_task/core/constants/app_colors.dart';

class LeaveDateField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final VoidCallback? onTap;

  const LeaveDateField({
    super.key,
    required this.hint,
    this.controller,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true,
      onTap: onTap,
      style: TextStyle(fontSize: 13.sp, color:  AppColors.black),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize: 13.sp, color: AppColors.lightGrey),
        suffixIcon: Icon(
          Icons.calendar_month_outlined,
          size: 20.w,
          color: Colors.grey.shade500,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.w),
          borderSide: BorderSide(color: AppColors.lightGrey,width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.w),
          borderSide: BorderSide(color: AppColors.lightGrey),
        ),
      ),
    );
  }
}