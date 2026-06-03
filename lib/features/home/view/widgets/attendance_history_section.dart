import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_task/core/common_widgets/custom_text.dart';
import 'package:mediezy_task/core/constants/app_colors.dart';
import 'package:mediezy_task/features/home/view/widgets/attendance_history_list_view.dart';

class AttendanceHistorySection extends StatelessWidget {
  const AttendanceHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w, right: 8.w),
      child: Column(
           mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customText(
                "Recent Activity",
                fontWeight: FontWeight.w700,
                color: AppColors.primaryGreen,
              ),
              Row(
                children: [
                  customText(
                    "View All  >",
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryGreen,
                  ),
                ],
              ),
            ],
          ),
          AttendanceHistoryListView(),
        ],
      ),
    );
  }
}
