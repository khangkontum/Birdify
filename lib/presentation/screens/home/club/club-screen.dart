import 'package:mobile_final/logic/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClubScreen extends StatelessWidget {
  const ClubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<AuthBloc>().add(LoggedOutEvent());
      },
      child: const Text("ClubScreen"),
    );
  }
}
