import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_route/auto_route.dart';

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
          onPressed: () => context.router.pop(),
          icon: const Icon(FontAwesomeIcons.arrowLeft)),
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
