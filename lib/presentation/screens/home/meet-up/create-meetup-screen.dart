import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:mobile_final/presentation/common/birdify.dart';

class CreatMeetupScreen extends StatelessWidget {
  const CreatMeetupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Birdify.appbar(),
        body: Center(
          child: Column(
            children: [
              AutoSizeText(
                "Create MeetUp",
                style: Theme.of(context).textTheme.headline2?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
              // DropdownSearch<String>(
              //   asyncItems: ,
              //   popupProps: const PopupProps.menu(
              //     showSelectedItems: true,
              //     // disabledItemFn: (String s) => s.startsWith('I'),
              //   ),
              //   items: const [
              //     "All Meet-Ups",
              //     "On-going Meet-Ups",
              //     'Archived Meet-ups'
              //   ],
              //   onChanged: print,
              //   selectedItem: "On-going MeetUps",
              // )
            ],
          ),
        ),
      ),
    );
  }
}
