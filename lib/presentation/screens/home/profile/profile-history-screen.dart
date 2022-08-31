import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_final/presentation/common/birdify.dart';
import 'package:mobile_final/presentation/screens/home/profile/profile-screen.dart';
import 'package:mobile_final/presentation/screens/home/profile/profile-archivement-screen.dart';

class ProfileHistoryScreen extends StatelessWidget {
  const ProfileHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Birdify.appbarWithoutBack(),
      body: Center(
        child: const _MyProfile(),
      ),
    );
  }
}

class _MyProfile extends StatelessWidget {
  const _MyProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      // body: profile()
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg.png'),
                  fit: BoxFit.cover,
                )
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                // height: height * 0.6,
                height: 675.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 90.h,
              child: Column(
                children: [
                  Stack(
                    children: [
                      buildImage(),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: buildEditIcon(Colors.blue),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'Nguyen Van A',
                          style: TextStyle(fontSize: 28, fontFamily: 'Roboto', fontWeight: FontWeight.w700),
                        ),
                        // Icon(Icons.edit),
                        TextButton.icon(
                          onPressed: (){}, 
                          icon: Icon(Icons.edit), 
                          label: Text(''), 
                          style: TextButton.styleFrom(
                            primary: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      'Developer, Male, 20',
                      style: TextStyle(fontSize: 20, fontFamily: 'Roboto', color: Colors.black45),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.location_pin),
                        Text(
                          'Ho Chi Minh City',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                          ),
                        ),
                      ],
                    )
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [

                      SizedBox(
                        height: height / 16,
                        width: width / 3.5,
                        child: FlatButton(
                          onPressed: () => Get.to(() => const ProfileScreen()),
                          // onPressed: (){},
                          child: Text(
                            'Overview',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.5,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: width / 3,
                        height: height / 16.5,
                        child: FlatButton(
                          onPressed: () => Get.to(() => const ProfileArchivementScreen()),
                          // onPressed: (){},
                          child: Text(
                            'Archivement',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.5,
                            ),
                          ),
                        ),
                      ),
                      SizedBox( width: 20),
                      SizedBox(
                        width: width / 4,
                        height: height / 16.5,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          color: Colors.black,
                          onPressed: () {},
                          child: Text(
                            'History',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
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
                        sTime: '6:30 - 8:30 am',
                        sDate: 'Wed 8/10/22',
                        sStatus: 'Đã thanh toán',
                        sHost: 'Kèo của @Khang',
                        sMeetingID: '#meeting50',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    final image = AssetImage('assets/user-avatar.png');

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: (){}),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
    color: Colors.white,
    all: 3,
    child: buildCircle(
      color: color,
      all: 7,
      child: Icon(
        Icons.add_a_photo,
        color: Colors.white,
        size: 20,
      ),
    ),
  );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}

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
