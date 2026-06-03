import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_task/core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
 final VoidCallback? onTap;
  final bool isGradient;
  final bool isOutlined;
   final double? fontSize;

  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isGradient = false,
    this.isOutlined = false, this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      height: 40.w,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),

            border: isOutlined
                ? Border.all(color: AppColors.primaryGreen,width: 2)
                : null,

            gradient: isGradient
                ? const LinearGradient(
                    colors: [
                      Color(0xFF042222), 
                      Color(0xFF03624C),
                    ],
                  )
                : null,

            color: isGradient || isOutlined
                ? null
                : AppColors.lightblue,
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: isOutlined ? AppColors.primaryGreen : AppColors.white,
         fontSize: fontSize ?? 12
            ),
          ),
        ),
      ),
    );
  }
}