// import 'package:mobile_final/logic/auth_bloc/auth_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_final/presentation/common/birdify.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Birdify.appbarWithoutBack(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Birdify.title(
              title: "Notifications",
            ),
            const _GroupTile(
              sUser: '@Khang',
              sAction: 'invited you to join',
              sMeeting: '#meeting4556',
            ),
            SizedBox(height: 10.h),
            const _GroupTile(
              sUser: '@Khang',
              sAction: 'reminds you to pay for',
              sMeeting: '#meeting4556',
            ),
            SizedBox(height: 10.h),
            const _GroupTile(sUser: '@Khang',
              sAction: 'created a new meeting',
              sMeeting: '#meeting4556',
            ),
            SizedBox(height: 10.h),
            const _GroupTile(
              sUser: 'Club @20CTT1',
              sAction: 'have 6 new meetings',
              sMeeting: '',
            ),
          ],
        ),
      ),
    );
  }
}

class _GroupTile extends StatelessWidget {
  const _GroupTile({
    Key? key,
    required this.sUser,
    required this.sAction,
    required this.sMeeting,
  }) : super(key: key);

  final String sUser;
  final String sAction;
  final String sMeeting;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 1.w,
        ),
        height: 75.h,
        width: 384.w,
        decoration: BoxDecoration(
            border: Border(
            top: BorderSide(
              color: Color.fromRGBO(0, 0, 0, 0.5),
              width: 0.5.w,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  size: 40.w,
                  color: Color.fromRGBO(255, 128, 0, 1),
                ),
                SizedBox(width: 22.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          sUser,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        SizedBox(width: 1.w),
                        AutoSizeText(
                          sAction,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(fontWeight: FontWeight.w100),
                        ),
                      ],
                    ),
                    if (sMeeting != '')
                      AutoSizeText(
                        sMeeting,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight: FontWeight.w100,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
