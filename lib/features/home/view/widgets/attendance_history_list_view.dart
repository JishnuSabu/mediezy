import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_task/core/common_widgets/custom_text.dart';
import 'package:mediezy_task/core/constants/app_colors.dart';
import 'package:mediezy_task/features/home/view_model/attendance/attendance_bloc.dart';
import 'package:mediezy_task/features/home/view_model/attendance/attendance_state.dart';

class AttendanceHistoryListView extends StatelessWidget {
  const AttendanceHistoryListView({super.key});

  @override
  Widget build(BuildContext context) {
  return BlocBuilder<AttendanceBloc, AttendanceState>(
  builder: (context, state) {
    final bloc = context.read<AttendanceBloc>();
    final route = bloc.cachedRouteList?.routeList ?? [];

    if (state is AttendanceRouteLoading && route.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (route.isEmpty) {
      return SizedBox(
        height: 130.w,
        child: Center(child: customText("No attendance history found!S",color: AppColors.lightblue)));
    }

    return _buildList(route);
  },
);
  }
}

Widget _buildList(List routeList) {
  if (routeList.isEmpty) {
    return Center(child: customText("No attendance history found"));
  }
  return ListView.builder(
    shrinkWrap: true,
    itemCount: routeList.length,
    itemBuilder: (context, index) {
      final item = routeList[index];
      return Container(
        height: 60.w,
        width: 349.w,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 1,
              spreadRadius: 1,
              offset: const Offset(0, 0.5),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/profile_icon.png",
              height: 30.w,
              width: 30.w,
            ),

            SizedBox(width: 12.w),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                    item.date,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),

                  customText(
                    "Marked in at ${item.markIn} | Marked out at ${item.markOut} ",
                    fontSize: 10.sp,
                    color: AppColors.lightGrey3,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
