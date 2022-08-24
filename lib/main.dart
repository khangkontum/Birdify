import 'package:flutter/material.dart';
import 'package:mobile_final/presentation/screens/login_screen.dart';
import 'package:mobile_final/presentation/style/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Final Mobile',
      theme: appTheme(context),
      home: LoginScreen(),
    );
  }
}
