import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_task/core/common_widgets/custom_date_picker.dart';
import 'package:mediezy_task/core/common_widgets/custom_text.dart';
import 'package:mediezy_task/core/constants/app_colors.dart';
import 'package:mediezy_task/features/home/view/widgets/leave_date_field.dart';
import 'package:mediezy_task/features/home/view/widgets/leave_reason_field.dart';
import 'package:mediezy_task/features/home/view/widgets/leave_type_drop_down_field.dart';

class FullDayLeaveScreen extends StatelessWidget {
  final TextEditingController fromController;

  final TextEditingController toController;

  final TextEditingController reasonController;

  final Function(String) onLeaveTypeChanged;

  const FullDayLeaveScreen({
    super.key,

    required this.fromController,

    required this.toController,

    required this.reasonController,

    required this.onLeaveTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 8.w, bottom: 5.w),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 1,
              spreadRadius: 1,
              offset: const Offset(0, 0.5),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText("From"),
                SizedBox(height: 2.w),
                LeaveDateField(
                  hint: "DD/MM/YYYY",
                  controller: fromController,
                  onTap: () => pickDate(context, fromController),
                ),

                SizedBox(height: 12.w),
                customText("To"),
                SizedBox(height: 2.w),
                LeaveDateField(
                  hint: "DD/MM/YYYY",
                  controller: toController,
                  onTap: () => pickDate(context, toController),
                ),

                SizedBox(height: 12.w),
                customText("Reason"),
                SizedBox(height: 2.w),
                LeaveReasonField(controller: reasonController),

                SizedBox(height: 12.w),
                customText("Leave Type"),
                SizedBox(height: 2.w),
                LeaveTypeDropdown(
                  onChanged: (value) {
                    if (value != null) {
                      onLeaveTypeChanged(value);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
