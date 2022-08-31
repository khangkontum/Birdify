import 'package:auto_size_text/auto_size_text.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mobile_final/data/models/meetup.dart';

class Birdify {
  static StatelessWidget button(
      {required Widget child,
      required Function onClick,
      required double height,
      required double width,
      Color color = Colors.black}) {
    return _BirdifyButton(
      onClick: onClick,
      height: height,
      width: width,
      color: color,
      child: child,
    );
  }

  static StatelessWidget title({
    required String title,
    String subtitle = '',
  }) {
    return _Title(
      title: title,
      subtitle: subtitle,
    );
  }

  static AppBar appbar({List<Widget> actions = const []}) {
    return AppBar(
      foregroundColor: Colors.black,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: actions,
      leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(FontAwesomeIcons.arrowLeft)),
    );
  }

  static StatelessWidget meetUpCard({
    required MeetUp meetUp,
    required void Function() onTap,
  }) {
    return _BirdifyCard(
      meetUp: meetUp,
      onTap: onTap,
    );
  }

  static AppBar appbarWithoutBack({
    List<Widget> actions = const [],
  }) {
    return AppBar(
      foregroundColor: Colors.black,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: actions,
    );
  }

  static StatelessWidget card({
    required double height,
    required double width,
    required Widget child,
  }) {
    return Container(
      height: height,
      width: width,
      // padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.5.w,
        ),
      ),
      child: child,
    );
  }

  static StatelessWidget stackCard({
    required double height,
    required double width,
    required Widget child,
    required Function() onTap,
  }) {
    return _StackCard(height: height, width: width, onTap: onTap, child: child);
  }
}

/// Use this button for notion like style.
class _BirdifyButton extends StatelessWidget {
  const _BirdifyButton(
      {Key? key,
      required this.child,
      required this.onClick,
      required this.height,
      required this.width,
      required this.color})
      : super(key: key);

  final Widget child;
  final double height;
  final double width;
  final Function onClick;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.h),
      height: height,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: color,
            offset: Offset(5.w, 5.h),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.black,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero),
              side: BorderSide(color: Colors.black)),
          // padding: EdgeInsets.all(10.0.w),
          shadowColor: Colors.black,
        ),
        onPressed: () {},
        child: child,
      ),
    );
  }
}

class _BirdifyCard extends StatelessWidget {
  const _BirdifyCard({
    Key? key,
    required this.meetUp,
    required this.onTap,
  }) : super(key: key);

  final void Function() onTap;

  final MeetUp meetUp;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                            '${formatDate(meetUp.startTime, [
                                  HH,
                                  ':',
                                  nn
                                ])}-${formatDate(meetUp.endTime, [
                                  HH,
                                  ':',
                                  nn
                                ])}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontWeight: FontWeight.w800),
                          ),
                          AutoSizeText(
                            formatDate(meetUp.startTime,
                                [D, ' ', d, '/', mm, '/', yyyy]),
                            // 'Sat 8/20/22',
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
                            meetUp.status,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontWeight: FontWeight.w800),
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
                            "${meetUp.creator.name ?? 'unknown'}'s meet-up",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                      AutoSizeText(
                        '#${meetUp.code}',
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

class _StackCard extends StatelessWidget {
  const _StackCard({
    Key? key,
    required this.height,
    required this.width,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  final double height;
  final double width;
  final Widget child;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: height,
        maxWidth: width,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Birdify.card(
            height: height - 5.h,
            width: width - 5.w,
            child: Container(),
          ),
          Positioned(
            left: 5.w,
            top: 5.h,
            child: GestureDetector(
              onTap: onTap,
              child: Birdify.card(
                height: height - 5.h,
                width: width - 5.w,
                child: Container(
                  color: Colors.white,
                  child: child,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          title,
          maxLines: 2,
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(height: 10.h),
        AutoSizeText(
          subtitle,
          maxLines: 2,
          style: Theme.of(context).textTheme.subtitle2?.copyWith(
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
              ),
        ),
      ],
    );
  }
}
