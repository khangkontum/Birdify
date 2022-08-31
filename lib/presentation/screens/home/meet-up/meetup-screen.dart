import 'package:auto_size_text/auto_size_text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_final/logic/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_final/logic/meetup/create-meetup-cubit/create_meetup_cubit.dart';
import 'package:mobile_final/presentation/common/birdify.dart';
import 'package:mobile_final/presentation/screens/home/meet-up/meetup-create-screen.dart';
import 'package:mobile_final/presentation/screens/home/meet-up/meetup-detail-screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeetupScreen extends StatelessWidget {
  const MeetupScreen({super.key});

  // final widgetList = [
  //   SizedBox(
  //     height: 105.h,
  //     width: 384.h,
  //     child: ElevatedButton(
  //       style: ElevatedButton.styleFrom(
  //         primary: Colors.white,
  //         onPrimary: Colors.black,
  //         shape: const RoundedRectangleBorder(
  //             borderRadius: BorderRadius.all(Radius.zero),
  //             side: BorderSide(color: Colors.black)),
  //         // padding: EdgeInsets.all(10.0.w),
  //         shadowColor: Colors.black,
  //       ),
  //       onPressed: () {},
  //       child: const AutoSizeText('adu'),
  //     ),
  //   ),
  // ];

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
        onPressed: () {
          context.read<CreateMeetupCubit>().create();
          // Get.to(() => const CreatMeetupScreen());
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Birdify.meetUpCard(
              onTap: () => Get.to(
                () => const MeetUpDetailScreen(),
              ),
            ),
          );
        },
      ),
    );
  }
}




// Container(
//           height: 105.h,
//           width: 384.h,
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               primary: Colors.white,
//               onPrimary: Colors.black,
//               shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.zero),
//                   side: BorderSide(color: Colors.black)),
//               // padding: EdgeInsets.all(10.0.w),
//               shadowColor: Colors.black,
//             ),
//             onPressed: () {},
//             child: const AutoSizeText('adu'),
//           ),);}
//       );}
// ListView.builder(
//   itemCount: 1,
//   itemBuilder: (BuildContext context, int index) {
//     return ;
//   },
// ),