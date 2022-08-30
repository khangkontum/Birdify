import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mobile_final/presentation/common/birdify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Birdify.appbar(),
        resizeToAvoidBottomInset: false,
        body: const SingleChildScrollView(child: Body()),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(22.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _Header(),
          SizedBox(height: 42.h),
          const _Bill(),
          SizedBox(height: 25.h),
          const _IncludedServices(),
          const _TotalPrice(),
          SizedBox(height: 40.h),
          const _PaymentButtons()
        ],
      ),
    );
  }
}

class _PaymentButtons extends StatelessWidget {
  const _PaymentButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          "Select pay methods",
          style: Theme.of(context).textTheme.subtitle2?.copyWith(
                fontWeight: FontWeight.w800,
              ),
        ),
        SizedBox(height: 20.h),
        const _PayWithCard(),
      ],
    );
  }
}

class _PayWithCard extends StatelessWidget {
  const _PayWithCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Birdify.card(
        height: 90.h,
        width: 384.w,
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                'Pay with cash',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Birdify.button(
                child: const AutoSizeText("Request Confirm"),
                onClick: () {},
                height: 50.h,
                width: 158.w,
              )
            ],
          ),
        ));
  }
}

class _TotalPrice extends StatelessWidget {
  const _TotalPrice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            'Total Price',
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
          Row(
            children: [
              AutoSizeText(
                '500.000',
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
              SizedBox(width: 2.w),
              AutoSizeText(
                'VND',
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _IncludedServices extends StatelessWidget {
  const _IncludedServices({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            "Included Services",
            style: Theme.of(context).textTheme.subtitle2?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
          SizedBox(height: 20.h),
          const _IncludedTile(),
          SizedBox(height: 15.h),
          const _IncludedTile(),
          SizedBox(height: 15.h),
          const _IncludedTile(),
          SizedBox(height: 15.h),
          const _IncludedTile(),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Birdify.title(
      title: "Payment for",
      subtitle: "#meeting4566",
    );
  }
}

class _Bill extends StatelessWidget {
  const _Bill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return AutoSizeText("vcc");
    return Container(
      width: 384.w,
      // padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.5.w,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BillTile(),
            SizedBox(height: 15.h),
            const BillTile(),
            SizedBox(height: 15.h),
            const BillTile(),
            SizedBox(height: 15.h),
            const BillTile(),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}

class BillTile extends StatelessWidget {
  const BillTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.circle_outlined,
              size: 14.w,
            ),
            SizedBox(width: 2.w),
            AutoSizeText(
              'Tiền nước',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        Row(
          children: [
            AutoSizeText(
              '500.000',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            SizedBox(width: 2.w),
            AutoSizeText(
              'VND',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
            ),
          ],
        )
      ],
    );
  }
}

class _IncludedTile extends StatelessWidget {
  const _IncludedTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.circle_outlined,
              size: 14.w,
            ),
            SizedBox(width: 2.w),
            AutoSizeText(
              'Tiền nước',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ],
    );
  }
}
