import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mediezy_task/core/common_widgets/custom_app_bar.dart';
import 'package:mediezy_task/core/common_widgets/custom_button.dart';
import 'package:mediezy_task/core/constants/app_colors.dart';
import 'package:mediezy_task/core/utils/validations.dart';
import 'package:mediezy_task/features/auth/model/sign_up_request_model.dart';
import 'package:mediezy_task/features/auth/view/widgets/signup_form_card_widget.dart';
import 'package:mediezy_task/features/auth/view_model/auth_bloc.dart';
import 'package:mediezy_task/features/auth/view_model/auth_event.dart';
import 'package:mediezy_task/features/auth/view_model/auth_state.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final firstNameCtr = TextEditingController();
  final lastNameCtr = TextEditingController();
  final emailCtr = TextEditingController();
  final addressCtr = TextEditingController();
  final dobCtr = TextEditingController();
  final mobileCtr = TextEditingController();
  final locationCtr = TextEditingController();
  final dojCtr = TextEditingController();
  final passwordCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppBar(showText: true),

              SignUpFormCardWidget(
                firstNameCtr: firstNameCtr,
                lastNameCtr: lastNameCtr,
                emailCtr: emailCtr,
                addressCtr: addressCtr,
                dobCtr: dobCtr,
                mobileCtr: mobileCtr,
                locationCtr: locationCtr,
                dojCtr: dojCtr,
                passwordCtr: passwordCtr,
              ),

              SizedBox(height: 10.w),

              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: AppColors.primaryGreen,
                      ),
                    );
                    context.go('/login');
                  }
                  if (state is AuthError) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    title: state is AuthLoading ? "Loading..." : "Save",
                    isGradient: true,
                    onTap: state is AuthLoading
                        ? null
                        : () {
                            final firstNameError = validateName(
                              firstNameCtr.text,
                            );
                            final lastNameError = validateName(
                              lastNameCtr.text,
                            );
                            final emailError = validateEmail(emailCtr.text);
                            final mobileError = validateMobile(mobileCtr.text);
                            final passwordError = validatePassword(
                              passwordCtr.text,
                            );
                            final addressError = validateAddress(
                              addressCtr.text,
                            );
                            final dobError = validateDate(dobCtr.text, "DOB");
                            final dojError = validateDate(dojCtr.text, "DOJ");

                            if (firstNameError != null ||
                                lastNameError != null ||
                                emailError != null ||
                                mobileError != null ||
                                passwordError != null ||
                                addressError != null ||
                                dobError != null ||
                                dojError != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    firstNameError ??
                                        lastNameError ??
                                        emailError ??
                                        mobileError ??
                                        passwordError ??
                                        addressError ??
                                        dobError ??
                                        dojError ??
                                        "",
                                  ),
                                ),
                              );
                              return;
                            }

                            context.read<AuthBloc>().add(
                              SignupSubmitted(
                                SignUpRequest(
                                  firstName: firstNameCtr.text.trim(),
                                  lastName: lastNameCtr.text.trim(),
                                  email: emailCtr.text.trim(),
                                  password: passwordCtr.text.trim(),
                                  address: addressCtr.text.trim(),
                                  dob: dobCtr.text.trim(),
                                  mobileNumber: mobileCtr.text.trim(),
                                  doj: dojCtr.text.trim(),
                                  location: locationCtr.text.trim(),
                                ),
                              ),
                            );
                          },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
