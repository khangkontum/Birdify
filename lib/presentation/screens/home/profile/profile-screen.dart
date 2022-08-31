import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_final/data/repositories/api_repository.dart';
import 'package:mobile_final/logic/auth_bloc/auth_bloc.dart';
import 'package:mobile_final/logic/profile/profile_detail_cubit.dart';
import 'package:mobile_final/presentation/common/birdify.dart';
import 'package:mobile_final/presentation/screens/home/profile/profile-edit-screen.dart';
import 'package:mobile_final/presentation/screens/home/profile/profile-history-screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Birdify.appbarWithoutBack(),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(
            side: BorderSide(width: 1.0, color: Colors.black)),
        elevation: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        child: const Icon(
          Icons.logout_rounded,
        ),
        onPressed: () {
          context.read<AuthBloc>().add(LoggedOutEvent());
        },
      ),
      body: BlocProvider(
        create: (context) => DetailProfileCubit(
          apiRepository: context.read<ApiRepository>(),
        ),
        child: const Center(
          child: _MyProfile(),
        ),
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
      body: BlocBuilder<DetailProfileCubit, DetailProfileState>(
        builder: (context, state) {
          if (state.status != DetailProfileStatus.success) {
            return Container(
              color: Colors.white,
              child: const Center(
                child: SpinKitFadingFour(
                  color: Colors.black,
                ),
              ),
            );
          }

          return Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/bg.png'),
                    fit: BoxFit.cover,
                  )),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    // height: height * 0.6,
                    height: 620.h,
                    decoration: const BoxDecoration(
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
                      buildImage(),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            state.user.name!,
                            style: const TextStyle(
                                fontSize: 28,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700),
                          ),
                          // Icon(Icons.edit),
                          TextButton.icon(
                            onPressed: () {
                              Get.to(() => const ProfileEditScreen());
                            },
                            icon: const Icon(Icons.edit),
                            label: const Text(''),
                            style: TextButton.styleFrom(
                              primary: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.location_pin),
                          Text(
                            state.user.location!,
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(height: 10),
                      // Row(
                      //   children: [
                      //     SizedBox(
                      //       width: width / 4,
                      //       height: height / 16.5,
                      //       child: TextButton(
                      //         style: TextButton.styleFrom(
                      //           elevation: 0,
                      //           primary: Colors.black,
                      //           textStyle: Theme.of(context)
                      //               .textTheme
                      //               .bodyText1
                      //               ?.copyWith(fontWeight: FontWeight.bold),
                      //         ),
                      //         onPressed: () {
                      //           showDialog(
                      //             context: context,
                      //             builder: (context) => const AlertDialog(
                      //               content: MyHistory(),
                      //             ),
                      //           );
                      //         },
                      //         child: const Text(
                      //           'History',
                      //           style: TextStyle(
                      //             fontWeight: FontWeight.w700,
                      //             fontSize: 16.5,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(height: 20),
                      Birdify.stackCard(
                        height: 87.h,
                        width: 362.w,
                        child: Padding(
                          padding: EdgeInsets.all(10.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/matches.png'),
                              SizedBox(width: 10.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    "Attended Meet Ups",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 10.h),
                                  AutoSizeText(
                                    "${state.user.attendedMeetups!} meet ups",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(fontWeight: FontWeight.w300),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                      const SizedBox(height: 20),
                      Birdify.stackCard(
                        height: 87.h,
                        width: 362.w,
                        child: Padding(
                          padding: EdgeInsets.all(10.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/matches.png'),
                              SizedBox(width: 10.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    "Total Paid",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 10.h),
                                  AutoSizeText(
                                    "${state.user.totalPaid!} VND",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(fontWeight: FontWeight.w300),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                      const SizedBox(height: 20),
                      Birdify.stackCard(
                        height: 87.h,
                        width: 362.w,
                        child: Padding(
                          padding: EdgeInsets.all(10.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/matches.png'),
                              SizedBox(width: 10.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    "Total Unpaid",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 10.h),
                                  AutoSizeText(
                                    "${state.user.totalUnpaid!} VND",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(fontWeight: FontWeight.w300),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildImage() {
    const image = AssetImage('assets/user-avatar.png');

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: () {}),
        ),
      ),
    );
  }
}
