import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_task/core/common_widgets/custom_text.dart';
import 'package:mediezy_task/core/constants/app_colors.dart';
import 'package:mediezy_task/features/home/model/leave/leave_list_res_model.dart';
import 'package:mediezy_task/features/home/view_model/leave/leave_bloc.dart';
import 'package:mediezy_task/features/home/view_model/leave/leave_state.dart';

class LeaveListTabCard extends StatelessWidget {
  final int filter;

  const LeaveListTabCard({required this.filter});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeaveBloc, LeaveState>(
      builder: (context, state) {
        if (state is LeaveListLoading) {
          return Center(child: CircularProgressIndicator(color:AppColors.primaryGreen ,));
        }

        if (state is LeaveListLoaded) {
          List<LeaveItem> list = state.data.leaves;

          if (filter != -1) {
            list = list.where((e) => e.status == filter).toList();
          }
          if (list.isEmpty) {
            return Center(
              child: customText(
                "No Leaves Found",
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryGreen,
              ),
            );
          }

          return ListView.builder(
            itemCount: list.length,

            itemBuilder: (context, index) {
              final item = list[index];

              return Padding(
                padding: EdgeInsets.only(left: 6.w, right: 6.w, bottom: 4.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8.w),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: const Offset(0, 0.5), // shadow direction
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.w),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        customText(
                          item.leaveMode == "full_day"
                              ? "Full Day Application"
                              : "Half Day Application",
                          fontSize: 12.sp,
                          color: AppColors.lightGrey3,
                        ),

                        customText(
                          item.startDate,

                          fontSize: 15.sp,
                          fontWeight: FontWeight.w900,
                        ),

                        customText(
                          item.leaveType,
                          fontSize: 12.sp,
                          color: AppColors.yellow,
                        ),

                        Text(
                          item.status == 0
                              ? "Pending"
                              : item.status == 1
                              ? "Approved"
                              : "Rejected",
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }

        return SizedBox();
      },
    );
  }
}
