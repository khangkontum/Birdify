import 'package:go_router/go_router.dart';
import 'package:mobile_final/presentation/routers/auth_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AuthGate(),
    )
  ],
);
