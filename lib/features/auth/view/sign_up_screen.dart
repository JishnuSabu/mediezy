import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_task/core/common_widgets/custom_app_bar.dart';
import 'package:mediezy_task/core/common_widgets/custom_bottom_divider.dart';
import 'package:mediezy_task/core/common_widgets/custom_button.dart';
import 'package:mediezy_task/features/auth/view/widgets/signup_form_card_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30.w),
          CustomAppBar(showText: true),
          SignUpFormCardWidget(),
          SizedBox(height: 10.w,),
          CustomButton(title: "Save",isGradient: true, onTap: (){}),
              SizedBox(height: 20),
                      CustomBottomDivider()
        ],
      ),
    );
  }
}
