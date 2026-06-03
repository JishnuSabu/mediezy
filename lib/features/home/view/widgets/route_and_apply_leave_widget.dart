
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mediezy_task/core/common_widgets/custom_container_widget.dart';

class RouteAndApplyLeaveWidget extends StatelessWidget {
  const RouteAndApplyLeaveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomContainerWidget(
                isGradient: true,
                img: "assets/images/route.png",
                text: "Route",
                onTap: () {
                  context.push("/apply_leave");
                },
              ),
              CustomContainerWidget(img: "assets/images/calender.png",text: "Apply Leave", onTap: () {
                  context.push("/apply_leave");
                },),
            ],
          );
  }
}