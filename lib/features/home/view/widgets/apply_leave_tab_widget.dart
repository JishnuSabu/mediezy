import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_task/core/constants/app_colors.dart';
import 'package:mediezy_task/features/home/view/full_day_leave_screen.dart';
import 'package:mediezy_task/features/home/view/half_day_leave_screen.dart';

class LeaveTabWidget extends StatelessWidget {
  final TextEditingController fromController;

  final TextEditingController toController;

  final TextEditingController reasonController;

  final Function(String) onLeaveTypeChanged;

  const LeaveTabWidget({
    super.key,

    required this.fromController,

    required this.toController,

    required this.reasonController,

    required this.onLeaveTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            padding:  EdgeInsets.all(1.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: const Offset(0, 0.5), // shadow direction
                ),
              ],
              borderRadius: BorderRadius.circular(30),
            ),
            child: TabBar(
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF042222), Color(0xFF03624C)],
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black87,
              labelStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              tabs: const [
                Tab(height: 40, text: "Full Day"),
                Tab(height: 40, text: "Half Day"),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: TabBarView(
              children: [
                FullDayLeaveScreen(
                  fromController: fromController,

                  toController: toController,

                  reasonController: reasonController,

                  onLeaveTypeChanged: onLeaveTypeChanged,
                ),

                HalfDayLeaveScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
