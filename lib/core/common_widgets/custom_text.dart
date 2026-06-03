 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_task/core/constants/app_colors.dart';

Widget customText(String text,{double? fontSize,FontWeight? fontWeight,Color? color}){
  return Text(text,style: TextStyle(fontSize:fontSize ?? 14.sp,fontWeight:fontWeight ??  FontWeight.w600,color:color ?? AppColors.black ));
}
