import 'package:flutter/material.dart';
import 'package:mobile_final/logic/auth_bloc/auth_bloc.dart';
import 'package:mobile_final/presentation/screens/home_screen.dart';
import 'package:mobile_final/presentation/screens/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        switch (state.status) {
          case AuthStatus.authenticated:
            return const HomeScreen();
          case AuthStatus.unauthenticated:
            return const LoginScreen();
        }
      },
    );
    // FlowBuilder<AuthStatus>(
    //   state: context.select((AuthBloc bloc) => bloc.state.status),
    //   onGeneratePages: onGenerateAppView,
    // );
  }
}

// List<Page> onGenerateAppView(
//   AuthStatus status,
//   List<Page<dynamic>> pages,
// ) {
//   switch (status) {
//     case AuthStatus.authenticated:
//       return [HomeScreen.page()];
//     case AuthStatus.unauthenticated:
//       return [LoginScreen.page()];
//   }
// }
