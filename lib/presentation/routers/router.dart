import 'package:go_router/go_router.dart';
import 'package:mobile_final/presentation/routers/auth_router.dart';
import 'package:mobile_final/presentation/screens/club_screen.dart';
import 'package:mobile_final/presentation/screens/home_screen.dart';
import 'package:mobile_final/presentation/screens/match_listing_screen.dart';
import 'package:mobile_final/presentation/screens/notification_screen.dart';
import 'package:mobile_final/presentation/screens/profile_screen.dart';
import 'package:mobile_final/presentation/screens/signup_screen.dart';
import 'package:auto_route/auto_route.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AuthGate(),
      routes: [
        GoRoute(
          path: 'signup',
          builder: (_, __) => const SignupScreen(),
        ),
        GoRoute(
          path: 'match-listing',
          builder: (_, __) => const MatchListingScreen(),
        ),
        GoRoute(
          path: 'club',
          builder: (_, __) => const MatchListingScreen(),
        ),
        GoRoute(
          path: 'notification',
          builder: (_, __) => const MatchListingScreen(),
        ),
        GoRoute(
          path: 'profile',
          builder: (_, __) => const MatchListingScreen(),
        ),
      ],
    ),
  ],
);

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: AuthGate,
      initial: true,
      children: [
        AutoRoute(
          path: '/signup',
          page: SignupScreen,
        ),
        AutoRoute(
          path: 'home',
          page: HomeScreen,
          children: [
            AutoRoute(
              path: 'match-listing',
              page: MatchListingScreen,
            ),
            AutoRoute(
              path: 'club',
              page: ClubScreen,
            ),
            AutoRoute(
              path: 'notification',
              page: NotificationScreen,
            ),
            AutoRoute(
              path: 'profile',
              page: ProfileScreen,
            ),
          ],
        )
      ],
    ),
  ],
)
class $myAppRouter {}
