import 'package:flutter/material.dart';
import 'package:mobile_final/logic/auth_bloc/auth_bloc.dart';
import 'package:mobile_final/presentation/screens/home_screen.dart';
import 'package:mobile_final/presentation/screens/login_screen.dart';

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
