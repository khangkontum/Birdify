import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_final/presentation/screens/home/chat/chat-detail-screen.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  Container room() {
    return Container(
      height: 105.h,
      width: 384.w,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.black, width: 1.5.w),
          left: BorderSide(color: Colors.black, width: 1.5.w),
          right: BorderSide(color: Colors.black, width: 1.5.w),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => Get.to(() => const ChatDetailScreen()),
          child: room(),
        );
      },
    );
  }
}
