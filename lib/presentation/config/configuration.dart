import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AppConfiguration extends StatelessWidget {
  const AppConfiguration({Key? key, required this.app}) : super(key: key);

  final Widget app;

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayOpacity: .8,
      overlayWidget: const SpinKitFadingFour(
        color: Colors.black,
      ),
      child: ScreenUtilInit(
          designSize: const Size(428, 926),
          minTextAdapt: true,
          builder: (context, child) {
            return app;
          }),
    );
  }
}
