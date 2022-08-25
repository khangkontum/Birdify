import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_final/data/repositories/auth_repository.dart';
import 'package:mobile_final/logic/login_cubit/login_cubit.dart';
import 'package:mobile_final/presentation/style/custom/input_box_decoration.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: LoginScreen());

  @override
  Widget build(BuildContext context) {
    Size sized = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/login-badminton.png',
              width: sized.width * .7,
            ),
            const SizedBox(height: 42),
            AutoSizeText(
              "Welcome Back",
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 42),
            BlocProvider(
              create: (context) => LoginCubit(
                context.read<AuthRepository>(),
              ),
              child: LoginForm(sized: sized),
            )
          ],
        ),
      ),
    ));
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.sized,
  }) : super(key: key);

  final Size sized;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.error) {
          // TODO: error handling
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _EmailInput(sized: sized),
          const SizedBox(height: 25),
          _PasswordInput(sized: sized),
          const SizedBox(height: 30),
          const _LoginButton(),
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({required this.sized, Key? key}) : super(key: key);

  final Size sized;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sized.height * 0.07,
      width: sized.width * 0.8,
      decoration: inputBoxDecoration,
      child: BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          return TextFormField(
              onChanged: (value) =>
                  context.read<LoginCubit>().emailChanged(value),
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(hintText: "Email"));
        },
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key, required this.sized}) : super(key: key);

  final Size sized;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sized.height * 0.07,
      width: sized.width * 0.8,
      decoration: inputBoxDecoration,
      child: BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return TextFormField(
            onChanged: (value) =>
                context.read<LoginCubit>().passwordChanged(value),
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(hintText: "Password"),
          );
        },
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await context.read<LoginCubit>().logInWithCredentials();
      },
      child: const AutoSizeText("Log In"),
    );
  }
}
