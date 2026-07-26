import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });

  final TextEditingController usernameController;
  final TextEditingController passwordController;

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          controller: widget.usernameController,
          hintText: 'Username',
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter your username';
            }
            return null;
          },
        ),
        verticalSpace(18),
        AppTextFormField(
          controller: widget.passwordController,
          hintText: 'Password',
          isObscureText: isObscureText,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isObscureText = !isObscureText;
              });
            },
            icon: Icon(
              isObscureText
                  ? Icons.visibility_off
                  : Icons.visibility,
            ),
          ),
        ),
      ],
    );
  }
}