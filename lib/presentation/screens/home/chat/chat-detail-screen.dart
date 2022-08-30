import 'package:flutter/material.dart';
import 'package:mobile_final/presentation/common/birdify.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: Birdify.appbar(),
      body: SingleChildScrollView(),
    ));
  }
}
