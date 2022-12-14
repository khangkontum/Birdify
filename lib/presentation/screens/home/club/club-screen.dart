import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_final/data/models/club.dart';
import 'package:mobile_final/data/repositories/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_final/logic/club/cubit/club_join_cubit.dart';
import 'package:mobile_final/logic/club/cubit/club_listing_cubit.dart';
import 'package:mobile_final/presentation/common/birdify.dart';
import 'package:mobile_final/presentation/screens/home/club/club-create-screen.dart';
import 'package:mobile_final/presentation/screens/home/club/club-detail-screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ClubScreen extends StatelessWidget {
  const ClubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListingClubCubit(
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
    return BlocListener<ListingClubCubit, ListingClubState>(
      listener: (context, state) {
        if (state.status == ListingClubStatus.submitting) {
          context.loaderOverlay.show();
        }
        if (state.status == ListingClubStatus.error) {
          context.loaderOverlay.hide();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: AutoSizeText(state.errorStatus)),
          );
        }
        if (state.status == ListingClubStatus.success) {
          context.loaderOverlay.hide();
        }
      },
      child: BlocBuilder<ListingClubCubit, ListingClubState>(
        builder: (context, state) {
          if (state.status != ListingClubStatus.success) {
            return const Center(
              child: SpinKitFadingFour(
                color: Colors.black,
              ),
            );
          }
          return Scaffold(
            appBar: Birdify.appbarWithoutBack(),
            floatingActionButton: Stack(
              children: const [
                _CreateClubButton(),
                _JoinButton(),
              ],
            ),
            body: ListView.builder(
              itemCount: state.clubs.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Column(
                    children: [
                      _GroupTile(club: state.clubs[index]),
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

class _CreateClubButton extends StatelessWidget {
  const _CreateClubButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 31.w),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: FloatingActionButton(
          heroTag: null,
          shape: const CircleBorder(
              side: BorderSide(width: 1.0, color: Colors.black)),
          elevation: 0.5,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          onPressed: () {
            Get.to(() => const ClubCreateScreen());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class _JoinButton extends StatelessWidget {
  const _JoinButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        heroTag: null,
        shape: const CircleBorder(
            side: BorderSide(width: 1.0, color: Colors.black)),
        elevation: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => BlocProvider(
              create: (context) => JoinClubCubit(
                context.read<ApiRepository>(),
              ),
              child: Dialog(
                backgroundColor: const Color(0xFFfafafa),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                elevation: 20,
                child: Container(
                  padding: EdgeInsets.all(22.w),
                  height: 220.h,
                  child: BlocListener<JoinClubCubit, JoinClubState>(
                    listener: (context, state) {
                      if (state.status == JoinClubStatus.submitting) {
                        context.loaderOverlay.show();
                      }
                      if (state.status == JoinClubStatus.error) {
                        context.loaderOverlay.hide();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: AutoSizeText(state.errorStatus)),
                        );
                      }
                      if (state.status == JoinClubStatus.success) {
                        context.loaderOverlay.hide();

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: AutoSizeText("Joined club successfully"),
                          ),
                        );
                        Get.back();
                      }
                    },
                    child: BlocBuilder<JoinClubCubit, JoinClubState>(
                        builder: (context, state) {
                      return Column(
                        children: [
                          AutoSizeText(
                            "Join with Invite Code",
                            style:
                                Theme.of(context).textTheme.subtitle1?.copyWith(
                                      fontWeight: FontWeight.w800,
                                    ),
                          ),
                          SizedBox(height: 20.h),
                          TextFormField(
                            decoration:
                                const InputDecoration(hintText: "Invite Code"),
                            autofocus: true,
                            onChanged: (value) => context
                                .read<JoinClubCubit>()
                                .codeChanged(value),
                          ),
                          const Spacer(),
                          Birdify.button(
                            height: 30.h,
                            width: 200.w,
                            onClick: () {
                              context.read<JoinClubCubit>().join();
                            },
                            child: AutoSizeText(
                              "Join",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          )
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
          );
        },
        child: const Icon(Iconsax.cloud_add),
      ),
    );
  }
}

class _GroupTile extends StatelessWidget {
  const _GroupTile({
    required this.club,
    Key? key,
  }) : super(key: key);

  final Club club;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => ClubDetailScreen(
            clubCode: club.code,
          )),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 10.w,
        ),
        height: 148.h,
        width: 384.w,
        // padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1.5.w,
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
                  size: 70.w,
                ),
                SizedBox(width: 22.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      club.name,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    AutoSizeText(
                      '@${club.code}',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.w200,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                    AutoSizeText(
                      '${club.members.length.toString()} members',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.w200),
                    ),
                  ],
                )
              ],
            ),
            AutoSizeText('10 meetings on-going',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
