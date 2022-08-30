import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_final/presentation/common/birdify.dart';

class ClubDetailScreen extends StatelessWidget {
  const ClubDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(
              side: BorderSide(width: 1.0, color: Colors.black)),
          elevation: 0.5,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          onPressed: () {},
          child: const Icon(Iconsax.message)),
      appBar: Birdify.appbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(22.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Birdify.title(
                title: "Group One",
                subtitle: "@groupName",
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
      ),
    ));
  }
}
