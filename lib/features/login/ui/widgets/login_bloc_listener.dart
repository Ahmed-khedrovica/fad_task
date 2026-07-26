import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        }

        if (state is LoginSuccess) {
          Navigator.pop(context);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Welcome ${state.response.firstName}')),
          );

          // Navigator.pushReplacement(...)
        }

        if (state is LoginFailure) {
          Navigator.pop(context);

          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Login Failed'),
              content: Text(state.message),
            ),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
