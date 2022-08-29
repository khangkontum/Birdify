import 'package:mobile_final/presentation/routers/auth_router.dart';
import 'package:mobile_final/presentation/screens/home_screen.dart';
import 'package:mobile_final/presentation/screens/login_screen.dart';
import 'package:mobile_final/presentation/screens/signup_screen.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(replaceInRouteName: 'Screen,Route', routes: [
  AutoRoute(
    path: '/',
    page: AuthGate,
    initial: true,
  ),
  AutoRoute(
    path: '/login',
    page: LoginScreen,
    children: [
      AutoRoute(
        path: 'signup',
        page: SignupScreen,
      ),
    ],
  ),
  AutoRoute(
    path: '/home',
    page: HomeScreen,
  )
])
class $myAppRouter {}
