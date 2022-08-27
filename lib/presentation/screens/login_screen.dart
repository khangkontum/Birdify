import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_final/data/providers/auth_google_provider.dart';
import 'package:mobile_final/data/repositories/auth_repository.dart';
import 'package:mobile_final/logic/login_cubit/login_cubit.dart';
import 'package:mobile_final/presentation/common/birdify.dart';
import 'package:mobile_final/presentation/common/input_box_decoration.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: LoginScreen());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: CustomScrollView(slivers: [
              SliverFillRemaining(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/login-badminton.png',
                      width: 303.w,
                      height: 225.77.h,
                    ),
                    SizedBox(height: 42.h),
                    AutoSizeText(
                      "Welcome Back",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(height: 42.h),
                    BlocProvider(
                      create: (context) => LoginCubit(
                        context.read<AuthRepository>(),
                      ),
                      child: const LoginForm(),
                    ),
                    SizedBox(height: 20.h),
                    const _SignupButton(),
                    const _ForgotPassword(),
                    const Spacer(),
                    const _LoginViaGoogle(),
                    SizedBox(height: 22.h)
                  ],
                ),
              )
            ])),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.submitting) {
          context.loaderOverlay.show();
        }
        if (state.status == LoginStatus.error) {
          context.loaderOverlay.hide();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: AutoSizeText(state.errorStatus),
            ),
          );
        }
        if (state.status == LoginStatus.success) {
          context.loaderOverlay.hide();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Login Success")),
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const _EmailInput(),
          SizedBox(height: 25.h),
          const _PasswordInput(),
          SizedBox(height: 30.h),
          const _LoginButton(),
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62.h,
      width: 352.w,
      alignment: Alignment.center,
      decoration: inputBoxDecoration,
      child: BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          return TextFormField(
              onChanged: (value) =>
                  context.read<LoginCubit>().emailChanged(value),
              decoration: const InputDecoration(hintText: "Email"));
        },
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width: 352.w,
      alignment: Alignment.center,
      decoration: inputBoxDecoration,
      child: BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return TextFormField(
            onFieldSubmitted: (value) =>
                context.read<LoginCubit>().logInWithCredentials(),
            onChanged: (value) =>
                context.read<LoginCubit>().passwordChanged(value),
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
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
      style: TextButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero)),
        primary: Colors.white,
        backgroundColor: const Color(0xFF1C1C1E),
        textStyle: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      onPressed: () => context.read<LoginCubit>().logInWithCredentials(),
      child: Container(
        alignment: Alignment.center,
        width: 250.w,
        height: 40.h,
        child: const AutoSizeText("Log In"),
      ),
    );
  }
}

class _SignupButton extends StatelessWidget {
  const _SignupButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(
            side: BorderSide(width: 1),
            borderRadius: BorderRadius.all(Radius.zero)),
        primary: const Color(0xFF1C1C1E),
        backgroundColor: Colors.white,
        textStyle: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        context.push('/signup');
      },
      child: Container(
        alignment: Alignment.center,
        width: 250.w,
        height: 40.h,
        child: const AutoSizeText("Sign Up"),
      ),
    );
  }
}

class _ForgotPassword extends StatelessWidget {
  const _ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Opacity(
        opacity: .6,
        child: AutoSizeText(
          "Forgot password?",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}

class _LoginViaGoogle extends StatelessWidget {
  const _LoginViaGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Birdify.button(
      height: 48.h,
      width: 250.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/google_icon.png',
            width: 20.w,
            height: 20.h,
          ),
          SizedBox(width: 8.w),
          AutoSizeText(
            "Login via Google",
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(fontWeight: FontWeight.w800),
          ),
        ],
      ),
      onClick: () {},
    );
  }
}
