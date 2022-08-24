import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size sized = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
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
          Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputField(sized: sized, hintText: "Username"),
                const SizedBox(height: 25),
                InputField(sized: sized, hintText: "Password")
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.sized,
    required this.hintText,
  }) : super(key: key);

  final Size sized;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sized.height * 0.07,
      width: sized.width * 0.8,
      decoration: BoxDecoration(
          border: Border.all(
        color: const Color(0xFFAFB1B6),
      )),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: const Color(0xFFAFB1B6))),
      ),
    );
  }
}
