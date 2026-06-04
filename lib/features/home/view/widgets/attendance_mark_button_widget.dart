import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_task/core/common_widgets/custom_text.dart';
import 'package:mediezy_task/core/constants/app_colors.dart';
import 'package:mediezy_task/core/services/location_service.dart';
import 'package:mediezy_task/features/home/view_model/attendance/attendance_bloc.dart';
import 'package:mediezy_task/features/home/view_model/attendance/attendance_event.dart';
import 'package:mediezy_task/features/home/view_model/attendance/attendance_state.dart';

class AttendanceMarkButtonWidget extends StatelessWidget {
  const AttendanceMarkButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceBloc, AttendanceState>(
      builder: (context, state) {
        final bloc = context.read<AttendanceBloc>();
        final data =
            bloc.cachedStatus ??
            (state is AttendanceStatusLoaded ? state.data : null);

        final shiftTime = data?.attendance.shiftStartTime ?? "--";
        final status = data?.attendance.attendanceStatus ?? "--";

        final markIn = data?.attendance.markInTime ?? "--";
        final markOut = data?.attendance.markOutTime ?? "--";

        return Container(
          width: 345.w,
          height: 63.w,
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF042222), Color(0xFF03624C)],
            ),
            borderRadius: BorderRadius.circular(60),
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customText(
                    titleText(status),
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),

                  customText(
                    subtitleText(status, shiftTime, markIn, markOut),
                    color: AppColors.white,
                    fontSize: 12.sp,
                  ),
                ],
              ),

              if (showButton(status))
                InkWell(
                  onTap: () async {
                    final position = await LocationService.getCurrentLocation();

                    context.read<AttendanceBloc>().add(
                      MarkAttendance(
                        status: getAttendanceStatusCode(status),
                        latitude: position.latitude,
                        longitude: position.longitude,
                      ),
                    );
                  },

                  child: Container(
                    width: 89.w,
                    height: 35.w,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(60),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/mark icon.png",
                          height: 14.w,
                          width: 12.w,
                        ),

                        customText(
                          buttonText(status),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

String buttonText(String status) {
  switch (status) {
    case "not_marked_in":
      return " Mark In";

    case "marked_in":
      return " Mark Out";

    case "marked_out":
      return " Mark In";

    default:
      return "--";
  }
}

String getAttendanceStatusCode(String status) {
  switch (status) {
    case "not_marked_in":
      return "1"; 

    case "marked_in":
      return "2";

    default:
      return "1";
  }
}

String titleText(String status) {
  switch (status) {
    case "not_marked_in":
      return "Start Your Day!";

    case "marked_in":
      return "Your work started";

    case "marked_out":
      return "Your Day Completed";

    default:
      return "--";
  }
}

String subtitleText(
  String status,
  String shiftTime,
  String? markIn,
  String? markOut,
) {
  switch (status) {
    case "not_marked_in":
      return "Your shift start at $shiftTime";

    case "marked_in":
      return "Checked in at $markIn";

    case "marked_out":
      return "Started at $markIn Ended at $markOut";

    default:
      return "--";
  }
}

bool showButton(String status) {
  return status != "marked_out";
}
