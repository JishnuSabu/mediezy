import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_task/core/constants/app_colors.dart';

class CustomBottomDivider extends StatelessWidget {
  const CustomBottomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                        width: 134.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      );
  }
}