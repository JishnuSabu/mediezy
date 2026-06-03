import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_task/core/common_widgets/custom_text.dart';
import 'package:mediezy_task/core/config/di/injection.dart';
import 'package:mediezy_task/core/services/storage_services.dart';
import 'package:mediezy_task/features/home/view/widgets/attendance_mark_button_widget.dart';
import 'package:mediezy_task/features/home/view/widgets/route_and_apply_leave_widget.dart';

class UserDashBoardScreen extends StatelessWidget {
  const UserDashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userDetails = sl<StorageService>();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 60.w),
          Image.asset(
            "assets/images/profile_icon.png",
            height: 65.w,
            width: 65.w,
          ),

          customText(
            "Hi ${userDetails.userName}",
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
          customText(
            "Sales Executive",
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on_outlined),
              customText(
                "Ernakulam",
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          SizedBox(height: 10.w),
          AttendanceMarkButtonWidget(),
          SizedBox(height: 25.w),
         RouteAndApplyLeaveWidget()
        ],
      ),
    );
  }
}
