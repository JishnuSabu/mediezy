import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_task/core/common_widgets/custom_text.dart';
import 'package:mediezy_task/core/constants/app_colors.dart';

class CustomContainerWidget extends StatelessWidget {
   CustomContainerWidget({super.key, this.isGradient = false, required this.img, required this.text,this.onTap});
  final bool isGradient;
    final String img;
       final String text;
       void Function()? onTap;
       
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 98.w,
        width: 156.w,
        decoration: BoxDecoration(
          gradient: isGradient
              ? const LinearGradient(
                  colors: [Color(0xFF042222), Color(0xFF03624C)],
                )
              : null,
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
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
          padding:  EdgeInsets.only(left:18.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(img, height: 34, width: 34),
              customText(text,fontSize: 14.sp,fontWeight: FontWeight.w700,color: isGradient ? AppColors.white :AppColors.primaryGreen)
            ],
          ),
        ),
      ),
    );
  }
}
