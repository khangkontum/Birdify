import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mobile_final/presentation/common/birdify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MeetUpDetailScreen extends StatelessWidget {
  const MeetUpDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: Birdify.appbar(context: context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Header(),
              SizedBox(height: 50.h),
              AutoSizeText(
                'Appointment',
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 280.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                'Kèo của @Khang',
                maxLines: 2,
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 10.h),
              AutoSizeText(
                '#meeting4455',
                maxLines: 2,
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                    ),
              ),
            ],
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
