import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:mobile_final/logic/auth_bloc/auth_bloc.dart';
import 'package:mobile_final/presentation/screens/home/home_screen.dart';
import 'package:mobile_final/presentation/screens/auth/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<AuthStatus>(
      state: context.select((AuthBloc bloc) => bloc.state.status),
      onGeneratePages: onGenerateAppView,
    );
  }
}

List<Page> onGenerateAppView(
  AuthStatus status,
  List<Page<dynamic>> pages,
) {
  switch (status) {
    case AuthStatus.authenticated:
      return [HomeScreen.page()];
    case AuthStatus.unauthenticated:
      return [LoginScreen.page()];
  }
}
