// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../screens/home_screen.dart' as _i3;
import '../screens/login_screen.dart' as _i2;
import '../screens/signup_screen.dart' as _i4;
import 'auth_router.dart' as _i1;

class myAppRouter extends _i5.RootStackRouter {
  myAppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AuthGate.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AuthGate());
    },
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginScreen());
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.HomeScreen(key: args.key));
    },
    SignupRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SignupScreen());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(AuthGate.name, path: '/'),
        _i5.RouteConfig(LoginRoute.name, path: '/login', children: [
          _i5.RouteConfig(SignupRoute.name,
              path: 'signup', parent: LoginRoute.name)
        ]),
        _i5.RouteConfig(HomeRoute.name, path: '/home')
      ];
}

/// generated route for
/// [_i1.AuthGate]
class AuthGate extends _i5.PageRouteInfo<void> {
  const AuthGate() : super(AuthGate.name, path: '/');

  static const String name = 'AuthGate';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
      : super(LoginRoute.name, path: '/login', initialChildren: children);

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i6.Key? key})
      : super(HomeRoute.name, path: '/home', args: HomeRouteArgs(key: key));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.SignupScreen]
class SignupRoute extends _i5.PageRouteInfo<void> {
  const SignupRoute() : super(SignupRoute.name, path: 'signup');

  static const String name = 'SignupRoute';
}
