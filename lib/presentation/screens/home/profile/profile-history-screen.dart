import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_final/presentation/common/birdify.dart';
import 'package:mobile_final/presentation/screens/home/profile/profile-screen.dart';

class _BirdifyCard extends StatelessWidget {
  const _BirdifyCard({
    Key? key,
    String this.sTime = '',
    String this.sDate = '',
    String this.sStatus = '',
    String this.sHost = '',
    String this.sMeetingID = '',
  }) : super(key: key);

  final String sTime;
  final String sDate;
  final String sStatus;
  final String sHost;
  final String sMeetingID;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 145.h,
          maxWidth: 384.w,
        ),
        child: Column(
          children: [
            Container(
              height: 105.h,
              width: 384.w,
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.5.w,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            sTime,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontWeight: FontWeight.w800),
                          ),
                          AutoSizeText(
                            sDate,
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      fontWeight: FontWeight.w300,
                                    ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AutoSizeText(
                            sStatus,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          SizedBox(width: 2.w),
                          Icon(
                            Icons.circle,
                            size: 14.w,
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          AutoSizeText(
                            sHost,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                      AutoSizeText(
                        sMeetingID,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}

class MyHistory extends StatelessWidget {
  const MyHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _BirdifyCard(
          sTime: '8:30 - 11:00 am',
          sDate: 'Thu 8/18/22',
          sStatus: 'Chưa trả tiền',
          sHost: 'Kèo của @Khang',
          sMeetingID: '#meeting57',
        ),
        _BirdifyCard(
          sTime: '4:30 - 6:30 pm',
          sDate: 'Wed 8/10/22',
          sStatus: 'Đã thanh toán',
          sHost: 'Kèo của @Khang',
          sMeetingID: '#meeting51',
        ),
        _BirdifyCard(
          sTime: '6:30 - 8:30 am',
          sDate: 'Wed 8/10/22',
          sStatus: 'Đã thanh toán',
          sHost: 'Kèo của @Khang',
          sMeetingID: '#meeting50',
        ),
      ],
    );
  }
}
