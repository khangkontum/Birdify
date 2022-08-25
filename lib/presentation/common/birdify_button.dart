import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Use this button for notion like style.
class BirdifyButton extends StatelessWidget {
  const BirdifyButton({
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
