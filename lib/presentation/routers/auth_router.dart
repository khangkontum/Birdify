import 'package:flutter/material.dart';
import 'package:mobile_final/logic/auth_bloc/auth_bloc.dart';
import 'package:mobile_final/presentation/routers/router.gr.dart';
import 'package:mobile_final/presentation/screens/home_screen.dart';
import 'package:mobile_final/presentation/screens/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    // return FlowBuilder<AuthStatus>(
    //     state: context.select((AuthBloc bloc) => bloc.state.status),
    //     onGeneratePages: onGenerateAppView);
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: ((previous, current) => previous.status != current.status),
      builder: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          context.router.navigate(HomeRoute());
        } else {
          context.router.navigate(const LoginRoute());
        }
        return Container();
      },
    );
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
