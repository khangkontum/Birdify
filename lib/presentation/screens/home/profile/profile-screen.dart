// import 'package:mobile_final/logic/auth_bloc/auth_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_final/presentation/common/birdify.dart';
import 'package:mobile_final/presentation/screens/home/profile/profile-archivement-screen.dart';
import 'package:mobile_final/presentation/screens/home/profile/profile-history-screen.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                height: 620.h,
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
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          color: Colors.black,
                          onPressed: () {},
                          child: Text(
                            'Overview',
                            style: TextStyle(
                              color: Colors.white,
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
                          // onPressed: () => Get.to(() => const ProfileArchivementScreen()),
                          // onPressed: (){},
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: MyArchivement(),
                              ),
                            );
                          },
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
                          // onPressed: () => Get.to(() => const ProfileHistoryScreen()),
                          // onPressed: (){},
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: MyHistory(),
                              ),
                            );
                          },
                          child: Text(
                            'History',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16.5,
                              ),
                            ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  _OverviewButtonMatches(),
                  SizedBox(height: 35),
                  _OverviewButtonSkill(),
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

class _OverviewButtonMatches extends StatelessWidget {
  const _OverviewButtonMatches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Birdify.stackCard(
      height: 87.h,
      width: 362.w,
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/matches.png'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Số trận đã chơi",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    AutoSizeText(
                      "19 trận",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.w300),
                    ),
                    SizedBox(width: 35.w),
                    AutoSizeText(
                      "-",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.w300),
                    ),
                    SizedBox(width: 35.w),
                    AutoSizeText(
                      "Kể từ 9/4/2022",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                
              ],
            )
          ],
        ),
      ),
      onTap: (){},
    );
  }
}

class _OverviewButtonSkill extends StatelessWidget {
  const _OverviewButtonSkill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Birdify.stackCard(
      height: 87.h,
      width: 362.w,
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/skill.png'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Kỹ năng",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    AutoSizeText(
                      "Trung bình",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.w300),
                    ),
                    SizedBox(width: 10.w),
                    AutoSizeText(
                      "-",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.w300),
                    ),
                    SizedBox(width: 10.w),
                    Row(
                      children: [
                        AutoSizeText(
                          "Lối đánh",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(fontWeight: FontWeight.w300),
                        ),
                        SizedBox(width: 4.w),
                        AutoSizeText(
                          "Tấn công",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      onTap: (){},
    );
  }
}
