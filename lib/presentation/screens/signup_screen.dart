import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_final/data/repositories/auth_repository.dart';
import 'package:mobile_final/logic/signup_cubit/signup_cubit.dart';
import 'package:mobile_final/presentation/common/birdify.dart';
import 'package:mobile_final/presentation/common/input_box_decoration.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: SignupScreen());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            appBar: Birdify.appbar(
              context: context,
              actions: [
                Image.asset('assets/shuttlecock.png'),
                SizedBox(width: 22.w)
              ],
            ),
            resizeToAvoidBottomInset: false,
            body: CustomScrollView(slivers: [
              SliverFillRemaining(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      "Sign Up",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(height: 42.h),
                    BlocProvider(
                      create: (context) => SignupCubit(
                        context.read<AuthRepository>(),
                      ),
                      child: const SignupForm(),
                    ),
                    SizedBox(height: 20.h),
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

class SignupForm extends StatelessWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state.status == SignupStatus.submitting) {
          context.loaderOverlay.show();
        }
        if (state.status == SignupStatus.error) {
          // TODO: error handling
          context.loaderOverlay.hide();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Error")),
          );
        }
        if (state.status == SignupStatus.success) {
          context.loaderOverlay.hide();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: AutoSizeText(state.errorStatus),
            ),
          );
          context.pop();
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const _EmailInput(),
          SizedBox(height: 25.h),
          const _PasswordInput(),
          SizedBox(height: 30.h),
          const _SignupButton(),
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
      child: BlocBuilder<SignupCubit, SignupState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          return TextFormField(
              onChanged: (value) =>
                  context.read<SignupCubit>().emailChanged(value),
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
      child: BlocBuilder<SignupCubit, SignupState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return TextFormField(
            onChanged: (value) =>
                context.read<SignupCubit>().passwordChanged(value),
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
      onPressed: () async {
        await context.read<SignupCubit>().signupWithCredentials();
      },
      child: Container(
        alignment: Alignment.center,
        width: 250.w,
        height: 40.h,
        child: const AutoSizeText("Create Account"),
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
