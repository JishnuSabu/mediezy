import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mediezy_task/core/common_widgets/custom_bottom_divider.dart';
import 'package:mediezy_task/core/constants/app_colors.dart';
import 'package:mediezy_task/core/common_widgets/custom_button.dart';
import 'package:mediezy_task/core/common_widgets/custom_textfield.dart';
import 'package:mediezy_task/features/auth/view_model/auth_bloc.dart';
import 'package:mediezy_task/features/auth/view_model/auth_event.dart';
import 'package:mediezy_task/features/auth/view_model/auth_state.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController mobileCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Login Success"),
                  backgroundColor: AppColors.primaryGreen,
                ),
              );
              context.go('/home');
            }

            if (state is AuthError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/app logo.png",
                          width: 235.w,
                          height: 67.47.h,
                        ),

                        SizedBox(height: 50.w),

                        CustomTextField(
                          controller: mobileCtrl,
                          hint: "Mobile",
                          hintTextClr: AppColors.textClr,
                          borderRadius: BorderRadius.circular(30),
                          validator: (value) {
                            return context.read<AuthBloc>().validateMobile(
                              value ?? "",
                            );
                          },
                        ),

                        SizedBox(height: 18.w),

                        CustomTextField(
                          controller: passwordCtrl,
                          hint: "Password",
                          hintTextClr: AppColors.textClr,
                          isPassword: true,
                          borderRadius: BorderRadius.circular(30),
                          validator: (value) {
                            return context.read<AuthBloc>().validatePassword(
                              value ?? "",
                            );
                          },
                        ),
                        SizedBox(height: 24.w),

                        CustomButton(
                          title: state is AuthLoading ? "Loading..." : "Login",
                          fontSize: 14,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                LoginPressed(
                                  mobileCtrl.text.trim(),
                                  passwordCtrl.text.trim(),
                                ),
                              );
                            }
                          },
                        ),

                        SizedBox(height: 10.w),

                        CustomButton(
                          title: "Create Account",
                          isOutlined: true,
                          onTap: () {
                            context.push('/sign_up');
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  bottom: 16.h,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        "Powered by Mediezy",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textClr,
                        ),
                      ),
                      SizedBox(height: 20),

                      CustomBottomDivider(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
