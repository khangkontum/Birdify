import 'package:auto_size_text/auto_size_text.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobile_final/data/models/meetup.dart';
import 'package:mobile_final/data/repositories/api_repository.dart';
import 'package:mobile_final/logic/meetup/cubit/meetup_detail_cubit.dart';
import 'package:mobile_final/presentation/common/birdify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_final/presentation/screens/home/meet-up/payment-screen.dart';

class MeetUpDetailScreen extends StatelessWidget {
  const MeetUpDetailScreen({
    Key? key,
    required this.meetUpId,
    required this.clubCode,
  }) : super(key: key);

  final String meetUpId;
  final String clubCode;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => DetailMeetUpCubit(
          apiRepository: context.read<ApiRepository>(),
          meetUpId: meetUpId,
          clubCode: clubCode),
      child: BlocBuilder<DetailMeetUpCubit, DetailMeetUpState>(
        builder: (context, state) {
          if (state.status != DetailMeetUpStatus.success) {
            return Container(
              color: Colors.white,
              child: const Center(
                child: SpinKitFadingFour(
                  color: Colors.black,
                ),
              ),
            );
          }
          return Scaffold(
            appBar: Birdify.appbar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Header(
                      creator: state.meetUp.creator.name ?? 'Unknown',
                      meetUpId: state.meetUp.code,
                    ),
                    SizedBox(height: 50.h),
                    const _Subtitle(subtitle: 'Appointment'),
                    SizedBox(height: 15.h),
                    _AppointmentCard(meetUp: state.meetUp),
                    SizedBox(height: 30.h),
                    const _Subtitle(subtitle: 'Location'),
                    SizedBox(height: 15.h),
                    const _LocationCard(),
                    SizedBox(height: 10.h),
                    const _LocationMap(),
                    SizedBox(height: 30.h),
                    const _Subtitle(subtitle: 'Payment'),
                    SizedBox(height: 15.h),
                    const _PaymentButton(),
                    SizedBox(height: 65.h),
                    // TODO: Implement List of Participants
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ));
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle({Key? key, required this.subtitle}) : super(key: key);

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      subtitle,
      style: Theme.of(context).textTheme.subtitle2?.copyWith(
            fontWeight: FontWeight.w600,
          ),
    );
  }
}

class _AppointmentCard extends StatelessWidget {
  const _AppointmentCard({Key? key, required this.meetUp}) : super(key: key);

  final MeetUp meetUp;

  @override
  Widget build(BuildContext context) {
    return Birdify.card(
        height: 85.h,
        width: 384.w,
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    '${formatDate(meetUp.startTime, [
                          HH,
                          ':',
                          nn
                        ])}-${formatDate(meetUp.endTime, [HH, ':', nn])}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  AutoSizeText(
                    'Sat 8/20/22',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontWeight: FontWeight.w300),
                  )
                ],
              ),
              Birdify.button(
                child: const AutoSizeText("Add to Calendar"),
                onClick: () {},
                height: 37.h,
                width: 158.w,
              )
            ],
          ),
        ));
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
    String,
    required this.creator,
    required this.meetUpId,
  }) : super(key: key);

  final String creator;
  final String meetUpId;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 280.w),
          child: Birdify.title(
            title: "Meet-Up by @$creator",
            subtitle: "#$meetUpId",
          ),
        ),
        Icon(
          Icons.circle,
          size: 100.w,
        )
      ],
    );
  }
}

class _LocationCard extends StatelessWidget {
  const _LocationCard({Key? key}) : super(key: key);

  // final String

  @override
  Widget build(BuildContext context) {
    return Birdify.card(
      height: 100.h,
      width: 384.w,
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              "Nhà thi đấu Phú Thọ",
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 70.h,
                maxWidth: 374.w,
              ),
              child: AutoSizeText(
                "1 Lữ Gia, Phường 15, Quận 11, Thành phố Hồ Chí Minh",
                maxLines: 2,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _LocationMap extends StatelessWidget {
  const _LocationMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Birdify.card(
      height: 257.h,
      width: 384.w,
      child: Container(
        color: Colors.amberAccent,
      ),
    );
  }
}

class _PaymentButton extends StatelessWidget {
  const _PaymentButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Birdify.stackCard(
      height: 60.h,
      width: 384.w,
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle_outlined,
                  size: 14.w,
                ),
                SizedBox(width: 5.w),
                AutoSizeText(
                  'Total Price',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.w800),
                )
              ],
            ),
            Row(
              children: [
                AutoSizeText(
                  "50000",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.w800),
                ),
                AutoSizeText(
                  "VND",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.w300),
                ),
              ],
            )
          ],
        ),
      ),
      onTap: () => Get.to(
        () => const PaymentScreen(),
      ),
    );
  }
}
