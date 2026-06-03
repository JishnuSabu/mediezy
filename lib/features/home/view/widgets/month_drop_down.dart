import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_task/core/common_widgets/custom_text.dart';
import 'package:mediezy_task/core/config/di/injection.dart';
import 'package:mediezy_task/core/constants/app_colors.dart';
import 'package:mediezy_task/core/services/storage_services.dart';
import 'package:mediezy_task/features/home/view_model/leave/leave_bloc.dart';
import 'package:mediezy_task/features/home/view_model/leave/leave_event.dart';

class MonthDropdown extends StatelessWidget {
  const MonthDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final months = [
      "january",
      "february",
      "march",
      "april",
      "may",
      "june",
      "july",
      "august",
      "september",
      "october",
      "november",
      "december",
    ];

    final current = months[DateTime.now().month - 1];

    return Expanded(
      child: SizedBox(
        height: 29.h,
        child: DropdownButtonFormField(
          value: current,
        
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 4.h),
        
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.w),
              borderSide: BorderSide(
                color: AppColors.primaryGreen, // border color
                width: 1.5, // border thickness
              ),
            ),
        
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.w),
              borderSide: BorderSide(color: AppColors.primaryGreen, width: 1.5),
            ),
        
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.w)),
          ),
          icon: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryGreen,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(Icons.arrow_drop_down_outlined,color: AppColors.white,),
          ),
          isDense: true,
          items: months.map((e) {
            return DropdownMenuItem(
              value: e,
              child: customText(
                e.toUpperCase(),
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
              ),
            );
          }).toList(),
        
          onChanged: (month) {
            context.read<LeaveBloc>().add(
              FetchLeaves(
                employeeId: sl<StorageService>().userId!,
        
                leaveType: "all",
        
                month: month!,
              ),
            );
          },
        ),
      ),
    );
  }
}
