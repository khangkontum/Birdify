import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_final/presentation/screens/club-screen.dart';
import 'package:mobile_final/presentation/screens/meetup-screen.dart';
import 'package:mobile_final/presentation/screens/notification-screen.dart';
import 'package:mobile_final/presentation/screens/profile-screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomeScreen());

  static final List<Widget> _routeOption = <Widget>[
    MeetupScreen(),
    const ClubScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: HomeScreen._routeOption.elementAt(_selectedIndex),
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
            GButton(icon: Iconsax.activity, text: 'Meet Ups'),
            GButton(icon: Iconsax.cloud, text: 'Clubs'),
            GButton(icon: Iconsax.notification, text: 'Notifications'),
            GButton(icon: Iconsax.user, text: 'Profile'),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
