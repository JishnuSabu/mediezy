import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_task/core/common_widgets/custom_date_picker.dart';
import 'package:mediezy_task/core/common_widgets/custom_text.dart';
import 'package:mediezy_task/core/constants/app_colors.dart';
import 'package:mediezy_task/features/home/view/widgets/leave_date_field.dart';
import 'package:mediezy_task/features/home/view/widgets/leave_reason_field.dart';
import 'package:mediezy_task/features/home/view/widgets/leave_type_drop_down_field.dart';

class HalfDayLeaveScreen extends StatelessWidget {
  final TextEditingController dateController;
  final TextEditingController reasonController;

  final Function(String) onLeaveTypeChanged;

  const HalfDayLeaveScreen({
    super.key,
    required this.dateController,
    required this.reasonController,
    required this.onLeaveTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.w),
      padding: EdgeInsets.all(12.w),
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText("Date"),
            SizedBox(height: 4.w),
            LeaveDateField(
              hint: "DD/MM/YYYY",
              controller: dateController,
              onTap: () => pickDate(context, dateController),
            ),
        
            SizedBox(height: 6.w),
        
            customText("Reason"),
            SizedBox(height: 4.w),
            LeaveReasonField(controller: reasonController),
        
            SizedBox(height: 12.w),
        
            customText("Leave Type"),
            SizedBox(height: 4.w),
            LeaveTypeDropdown(
              onChanged: (value) {
                if (value != null) onLeaveTypeChanged(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
