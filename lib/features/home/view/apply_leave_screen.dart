import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mediezy_task/core/common_widgets/custom_app_bar.dart';
import 'package:mediezy_task/core/common_widgets/custom_button.dart';
import 'package:mediezy_task/core/common_widgets/custom_text.dart';
import 'package:mediezy_task/core/config/di/injection.dart';
import 'package:mediezy_task/core/services/storage_services.dart';
import 'package:mediezy_task/features/home/view/widgets/apply_leave_tab_widget.dart';
import 'package:mediezy_task/features/home/view_model/leave/leave_bloc.dart';
import 'package:mediezy_task/features/home/view_model/leave/leave_event.dart';
import 'package:mediezy_task/features/home/view_model/leave/leave_state.dart';

class ApplyLeaveScreen extends StatelessWidget {
  ApplyLeaveScreen({super.key});

  final fromCtr = TextEditingController();
  final toCtr = TextEditingController();
  final reasonCtr = TextEditingController();

  final ValueNotifier<String> leaveType = ValueNotifier("");
  final ValueNotifier<String> leaveMode = ValueNotifier("full_day");
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LeaveBloc, LeaveState>(
      listener: (context, state) {
        if (state is LeaveSuccess) {
          fromCtr.clear();
          toCtr.clear();
          reasonCtr.clear();
          leaveType.value = "";

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }

        if (state is LeaveError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },

      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  child: CustomAppBar(),
                ),

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(
                          'Apply Leave',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w900,
                        ),

                        SizedBox(height: 20.h),

                        Expanded(
                          child: LeaveTabWidget(
                            fromController: fromCtr,
                            toController: toCtr,
                            reasonController: reasonCtr,
                            onLeaveTypeChanged: (value) {
                              leaveType.value = value;
                            },
                            onLeaveModeChanged: (mode) {
                              leaveMode.value = mode;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 35.w),
                CustomButton(
                  title: context.watch<LeaveBloc>().state is LeaveLoading
                      ? "Applying..."
                      : "Apply",

                  isGradient: true,

                  onTap: context.watch<LeaveBloc>().state is LeaveLoading
                      ? null
                      : () {
                          final isHalfDay = leaveMode.value == "half_day";
                          final startDate = fromCtr.text;
                          final endDate = isHalfDay ? fromCtr.text : toCtr.text;
                          if (isHalfDay
                              ? fromCtr.text.isEmpty ||
                                    reasonCtr.text.isEmpty ||
                                    leaveType.value.isEmpty
                              : fromCtr.text.isEmpty ||
                                    toCtr.text.isEmpty ||
                                    reasonCtr.text.isEmpty ||
                                    leaveType.value.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Fill all fields")),
                            );

                            return;
                          }
                          final userId = sl<StorageService>().userId;
                          context.read<LeaveBloc>().add(
                            ApplyLeave(
                              leaveMode: leaveMode.value,
                              leaveType: leaveType.value,
                              startDate: startDate,
                              endDate: endDate,
                              reason: reasonCtr.text,
                              userId: userId ?? 1,
                            ),
                          );
                        },
                ),
                SizedBox(height: 15.w),
                CustomButton(
                  title: "Leave List",
                  isOutlined: true,
                  onTap: () {
                    context.push("/leave_list");
                  },
                ),
                SizedBox(height: 45.w),
                SizedBox(height: 8.w),
              ],
            ),
          ),
        );
      },
    );
  }
}
