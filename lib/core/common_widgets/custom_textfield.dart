import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_task/core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Color? hintTextClr;
  final Color? borderClr;
  final bool isPassword;
  final String? Function(String?)? validator;
  final BorderRadius? borderRadius ;
    final double? borderWidth;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.isPassword = false,
    this.hintTextClr,
    this.borderClr,
    this.validator,  this.borderRadius, this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(  
      controller: controller,
      obscureText: isPassword,
      validator: validator,

      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: hintTextClr, fontSize: 14),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius:borderRadius ?? BorderRadius.circular(8.w),
          borderSide: BorderSide(color: borderClr ?? AppColors.lightGrey,width: borderWidth ?? 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:borderRadius ?? BorderRadius.circular(8.w),
          borderSide: BorderSide(color: borderClr ?? AppColors.lightGrey,width: borderWidth ?? 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius:borderRadius ?? BorderRadius.circular(8.w),
          borderSide: BorderSide(color: borderClr ?? AppColors.lightGrey,width: borderWidth ?? 1),
          
        ),
        focusedErrorBorder:  OutlineInputBorder(
          borderRadius:borderRadius ?? BorderRadius.circular(8.w),
          borderSide: BorderSide(color: borderClr ?? AppColors.lightGrey,width: borderWidth ?? 1),
          
        ),
      ),
    );
  }
}
