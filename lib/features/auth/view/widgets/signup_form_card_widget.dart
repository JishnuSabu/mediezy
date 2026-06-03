import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_task/core/common_widgets/custom_text.dart';
import 'package:mediezy_task/core/common_widgets/custom_textfield.dart';
import 'package:mediezy_task/core/constants/app_colors.dart';

class SignUpFormCardWidget extends StatelessWidget {
  const SignUpFormCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
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
          padding: EdgeInsets.all(8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText("First Name"),
              CustomTextField(
                controller: TextEditingController(),
                hint: "Enter First Name",
                hintTextClr: AppColors.lightwhite,
                borderClr: AppColors.lightGrey2,
                borderWidth: 2,
              ),
              SizedBox(height: 7.w),
              customText("Last Name"),
              CustomTextField(
                controller: TextEditingController(),
                hint: "Enter Last Name",
                hintTextClr: AppColors.lightwhite,
                borderClr: AppColors.lightGrey2,
                borderWidth: 2,
              ),
              SizedBox(height: 7.w),
              customText("Email"),
              CustomTextField(
                controller: TextEditingController(),
                hint: "Enter Email",
                hintTextClr: AppColors.lightwhite,
                borderClr: AppColors.lightGrey2,
                borderWidth: 2,
              ),
              SizedBox(height: 7.w),
              customText("Address"),
              CustomTextField(
                controller: TextEditingController(),
                hint: "Enter Address",
                hintTextClr: AppColors.lightwhite,
                borderClr: AppColors.lightGrey2,
                borderWidth: 2,
              ),
              SizedBox(height: 7.w),
              customText("DOB"),
              CustomTextField(
                controller: TextEditingController(),
                hint: "Enter DOB",
                hintTextClr: AppColors.lightwhite,
                borderClr: AppColors.lightGrey2,
                borderWidth: 2,
              ),
              SizedBox(height: 7.w),
              customText("Mobile Number"),
              CustomTextField(
                controller: TextEditingController(),
                hint: "Enter Mobile Number",
                hintTextClr: AppColors.lightwhite,
                borderClr: AppColors.lightGrey2,
                borderWidth: 2,
              ),
              SizedBox(height: 7.w),
              customText("Location"),
              CustomTextField(
                controller: TextEditingController(),
                hint: "Enter Location",
                hintTextClr: AppColors.lightwhite,
                borderClr: AppColors.lightGrey2,
                borderWidth: 2,
              ),
              SizedBox(height: 7.w),
              customText("DOJ"),
              CustomTextField(
                controller: TextEditingController(),
                hint: "Enter DOJ",
                hintTextClr: AppColors.lightwhite,
                borderClr: AppColors.lightGrey2,
                borderWidth: 2,
              ),
              SizedBox(height: 7.w),
              customText("Password"),
              CustomTextField(
                controller: TextEditingController(),
                hint: "Enter Password",
                hintTextClr: AppColors.lightwhite,
                borderClr: AppColors.lightGrey2,
                borderWidth: 2,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
