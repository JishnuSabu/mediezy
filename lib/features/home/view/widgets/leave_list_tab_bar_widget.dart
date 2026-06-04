import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_task/core/common_widgets/custom_text.dart';
import 'package:mediezy_task/core/constants/app_colors.dart';
import 'package:mediezy_task/features/home/view/widgets/leave_list_tab_card.dart';
import 'package:mediezy_task/features/home/view/widgets/month_drop_down.dart';
import 'package:mediezy_task/features/home/view_model/leave/leave_bloc.dart';
import 'package:mediezy_task/features/home/view_model/leave/leave_state.dart';

class LeaveListTabBarWidget extends StatelessWidget {
  const LeaveListTabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,

      child: Builder(
        builder: (context) {
          final tabController = DefaultTabController.of(context);

          return AnimatedBuilder(
            animation: tabController,

            builder: (_, __) {
              final selectedTab = tabController.index;

              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(1.w),

                    decoration: BoxDecoration(
                      color: AppColors.white,

                      borderRadius: BorderRadius.circular(30),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),

                          blurRadius: 1,

                          spreadRadius: 1,
                        ),
                      ],
                    ),

                    child: SizedBox(
                      height: 40.w,
                      child: TabBar(
                        dividerColor: Colors.transparent,
                        indicator: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF042222), Color(0xFF03624C)],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: AppColors.white,
                        unselectedLabelColor: Colors.black87,
                        labelStyle: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        unselectedLabelStyle: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      
                        tabs: const [
                          Tab(text: "All"),
                      
                          Tab(text: "Pending"),
                      
                          Tab(text: "Approved"),
                      
                          Tab(text: "Rejected"),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(20.w),

                    child: Row(
                      children: [
                        const MonthDropdown(),

                        SizedBox(width: 10.w),

                        Expanded(
                          child: BlocBuilder<LeaveBloc, LeaveState>(
                            builder: (context, state) {
                              if (state is LeaveListLoading) {}

                              int count = 0;

                              if (state is LeaveListLoaded) {
                                final leaves = state.data.leaves;

                                switch (selectedTab) {
                                  case 0:
                                    count = leaves.length;

                                    break;

                                  case 1:
                                    count = leaves
                                        .where((e) => e.status == 0)
                                        .length;

                                    break;

                                  case 2:
                                    count = leaves
                                        .where((e) => e.status == 1)
                                        .length;

                                    break;

                                  case 3:
                                    count = leaves
                                        .where((e) => e.status == 2)
                                        .length;

                                    break;
                                }
                              }

                              return Container(
                                height: 29.h,

                                alignment: Alignment.center,

                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.primaryGreen,

                                    width: 2,
                                  ),

                                  borderRadius: BorderRadius.circular(30),
                                ),

                                child: customText(
                                  "Your Leave $count",
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: TabBarView(
                      children: [
                        LeaveListTabCard(filter: -1),

                        LeaveListTabCard(filter: 0),

                        LeaveListTabCard(filter: 1),

                        LeaveListTabCard(filter: 2),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
