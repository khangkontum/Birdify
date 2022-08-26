import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_final/logic/auth_bloc/auth_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static Page page() => MaterialPage<void>(child: HomeScreen());

  int _selectedIndex = 0;
  static const List<String> _routeOption = <String>[
    '/home',
    '/clubs',
    '/notification',
    'profile'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.pinkAccent,
        child: TextButton(
          onPressed: () {
            context.read<AuthBloc>().add(LoggedOutEvent());
          },
          child: const Text("Log Out"),
        ),
      ),
      bottomNavigationBar: GNav(
        rippleColor: Colors.grey[300]!,
        hoverColor: Colors.grey[100]!,
        gap: 8,
        activeColor: Colors.black,
        iconSize: 24,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        duration: const Duration(milliseconds: 400),
        tabBackgroundColor: Colors.grey[100]!,
        color: Colors.black,
        tabs: const [
          GButton(icon: Iconsax.house, text: 'Meetings'),
          GButton(icon: Iconsax.cloud, text: 'Clubs'),
          GButton(icon: Iconsax.notification, text: 'Notifications'),
          GButton(icon: Iconsax.user, text: 'Profile'),
        ],
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
