import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/di/dependency_injection.dart';
import '../../../../Core/helpers/spacing.dart';
import '../../../../Core/theming/styles.dart';
import '../../../../Core/widgets/app_text_button.dart';
import '../cubit/login_cubit.dart';
import '../widgets/already_have_an_account_text.dart';
import '../widgets/email_and_password.dart';
import '../widgets/login_bloc_listener.dart';
import '../widgets/termes_and_conditions_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome Back', style: AppTextStyles.font24BlueBold),
                  verticalSpace(8),
                  Text(
                    "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                    style: AppTextStyles.font14GreyRegular,
                  ),
                  verticalSpace(36),
                  Column(
                    children: [
                      EmailAndPassword(
                        usernameController: usernameController,
                        passwordController: passwordController,
                      ),
                      verticalSpace(24),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          'Forgot Password?',
                          style: AppTextStyles.font13BlueRegular,
                        ),
                      ),
                      verticalSpace(40),
                      AppTextButton(
                        buttonText: 'Login',
                        textStyle: AppTextStyles.font16WhiteSemiBold,
                        onPressed: () {
                          context.read<LoginCubit>().login(
                            username: usernameController.text.trim(),
                            password: passwordController.text,
                          );
                        },
                      ),
                      verticalSpace(16),
                      const TermesAndConditionsText(),
                      verticalSpace(60),
                      const DontHaveAnAccountText(),
                      const LoginBlocListener(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
