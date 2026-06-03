import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key,  this.showText = false});
final bool showText;
  @override
  Widget build(BuildContext context) {
    return   Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios, size: 27),
                  ),
                  SizedBox(width: 5.w),
                if(showText)  Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
              
                 Image.asset("assets/images/profile_icon.png",height: 30.w,width: 30.w,)]));
  }
}