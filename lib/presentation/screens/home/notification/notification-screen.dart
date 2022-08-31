import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_final/data/repositories/api_repository.dart';
import 'package:mobile_final/logic/notification/notification_listing_cubit.dart';
import 'package:mobile_final/presentation/common/birdify.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListingNotificationCubit(
        context.read<ApiRepository>(),
      ),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ListingNotificationCubit, ListingNotificationState>(
      listener: (context, state) {
        if (state.status == ListingNotificationStatus.submitting) {
          context.loaderOverlay.show();
        }
        if (state.status == ListingNotificationStatus.error) {
          context.loaderOverlay.hide();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: AutoSizeText(state.errorStatus)),
          );
        }
        if (state.status == ListingNotificationStatus.success) {
          context.loaderOverlay.hide();
        }
      },
      child: BlocBuilder<ListingNotificationCubit, ListingNotificationState>(
        builder: (context, state) {
          if (state.status != ListingNotificationStatus.success) {
            return const Center(
              child: SpinKitFadingFour(
                color: Colors.black,
              ),
            );
          }
          return Scaffold(
            appBar: Birdify.appbarWithoutBack(),
            body: ListView.builder(
              itemCount: state.notifications.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Column(
                    children: [
                      _GroupTile(
                          sUser: state.notifications[index].creator.name!,
                          sAction: state.notifications[index].action,
                          sMeeting: state.notifications[index].meetup),
                      SizedBox(height: 15.h),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _GroupTile extends StatelessWidget {
  const _GroupTile({
    Key? key,
    required this.sUser,
    required this.sAction,
    String this.sMeeting = '',
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
        height: 79.h,
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
                        SizedBox(width: 3.w),
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
