import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_final/data/repositories/api_repository.dart';
import 'package:mobile_final/logic/club/cubit/club_detail_cubit.dart';
import 'package:mobile_final/presentation/common/birdify.dart';
import 'package:mobile_final/presentation/screens/home/meet-up/create-meetup-screen.dart';

class ClubDetailScreen extends StatelessWidget {
  const ClubDetailScreen({
    Key? key,
    required this.clubCode,
  }) : super(key: key);

  final String clubCode;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => DetailClubCubit(
          apiRepository: context.read<ApiRepository>(), clubCode: clubCode),
      child: BlocBuilder<DetailClubCubit, DetailClubState>(
        builder: (context, state) {
          if (state.status != DetailClubStatus.success) {
            return Container(
              color: Colors.white,
              child: const Center(
                child: SpinKitFadingFour(
                  color: Colors.black,
                ),
              ),
            );
          }
          return Scaffold(
              floatingActionButton: FloatingActionButton(
                shape: const CircleBorder(
                  side: BorderSide(width: 1.0, color: Colors.black),
                ),
                elevation: 0.5,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                onPressed: () {
                  Get.to(
                    () => MeetUpCreateScreen(clubCode: clubCode),
                  );
                },
                child: const Icon(Icons.add),
              ),
              appBar: Birdify.appbar(),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(22.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Birdify.title(
                        title: state.club.name,
                        subtitle: "@${state.club.code}",
                      ),
                      SizedBox(height: 30.h),
                      DropdownSearch<String>(
                        popupProps: const PopupProps.menu(
                          showSelectedItems: true,
                          // disabledItemFn: (String s) => s.startsWith('I'),
                        ),
                        dropdownDecoratorProps: const DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            labelText: "filter",
                          ),
                        ),
                        items: const [
                          "All Meet-Ups",
                          "On-going Meet-Ups",
                          'Archived Meet-ups'
                        ],
                        onChanged: print,
                        selectedItem: "On-going MeetUps",
                      )
                    ],
                  ),
                ),
              ));
        },
      ),
    ));
  }
}
