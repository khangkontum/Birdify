import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Birdify {
  static StatelessWidget button({
    required Widget child,
    required Function onClick,
    required double height,
    required double width,
  }) {
    return _BirdifyButton(
      onClick: onClick,
      height: height,
      width: width,
      child: child,
    );
  }

  static AppBar appbar({
    List<Widget> actions = const [],
    required BuildContext context,
  }) {
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
    required void Function() onTap,
  }) {
    return _BirdifyCard(
      onTap: onTap,
    );
  }

  static AppBar appbarWithoutBack({
    List<Widget> actions = const [],
    required BuildContext context,
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
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.5.w,
        ),
      ),
      child: child,
    );
  }
}

/// Use this button for notion like style.
class _BirdifyButton extends StatelessWidget {
  const _BirdifyButton({
    Key? key,
    required this.child,
    required this.onClick,
    required this.height,
    required this.width,
  }) : super(key: key);

  final Widget child;
  final double height;
  final double width;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.h),
      height: height,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
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
    required this.onTap,
  }) : super(key: key);

  final void Function() onTap;

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
                            '8:30-11:30 am',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontWeight: FontWeight.w800),
                          ),
                          AutoSizeText(
                            'Sat 8/20/22',
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
                            'status',
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
                            'Meet-up host',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                      AutoSizeText(
                        '#meetingId',
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
