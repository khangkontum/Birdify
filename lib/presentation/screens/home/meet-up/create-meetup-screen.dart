import 'package:auto_size_text/auto_size_text.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:mobile_final/data/repositories/api_repository.dart';
import 'package:mobile_final/logic/meetup/cubit/create_meetup_cubit.dart';
import 'package:mobile_final/presentation/common/birdify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_final/presentation/common/input_box_decoration.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:get/get.dart';

class MeetUpCreateScreen extends StatelessWidget {
  const MeetUpCreateScreen({
    Key? key,
    required this.clubCode,
  }) : super(key: key);

  final String clubCode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateMeetupCubit(
        clubCode: clubCode,
        apiRepository: context.read<ApiRepository>(),
      ),
      child: SafeArea(
          child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: Birdify.appbar(),
        body: Center(
          child: BlocListener<CreateMeetupCubit, CreateMeetupState>(
            listener: (context, state) {
              if (state.status == CreateMeetupStatus.submitting) {
                context.loaderOverlay.show();
              }
              if (state.status == CreateMeetupStatus.error) {
                context.loaderOverlay.hide();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: AutoSizeText(state.errorStatus)),
                );
              }
              if (state.status == CreateMeetupStatus.success) {
                context.loaderOverlay.hide();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        AutoSizeText("Create Meet Up ${state.name} successful"),
                  ),
                );
                Get.back();
              }
            },
            child: const body(),
          ),
        ),
      )),
    );
  }
}

class body extends StatelessWidget {
  const body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AutoSizeText(
          "Create New MeetUp",
          style: Theme.of(context).textTheme.headline2?.copyWith(
                fontWeight: FontWeight.w800,
              ),
        ),
        SizedBox(height: 20.h),
        const _MeetUpNameInput(),
        SizedBox(height: 7.h),
        const _MeetUpLocationInput(),
        SizedBox(height: 7.h),
        const _MeetUpLocationAddressInput(),
        SizedBox(height: 7.h),
        const _DateMeetUp(),
        SizedBox(height: 7.h),
        const _TimeMeetUp(),
        SizedBox(height: 7.h),
        const _DurationMeetUp(),
        SizedBox(height: 20.h),
        const _CreateMeetingButton()
      ],
    );
  }
}

class _TimeMeetUp extends StatelessWidget {
  const _TimeMeetUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          "Time: ",
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontWeight: FontWeight.w300,
              ),
        ),
        TextButton(
            style: TextButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.black, width: 1, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            onPressed: () {
              DatePicker.showTime12hPicker(
                context,
                showTitleActions: true,
                onConfirm: (date) {
                  context.read<CreateMeetupCubit>().timeChosenChanged(date);
                },
                currentTime: DateTime.now(),
                locale: LocaleType.vi,
              );
            },
            child: BlocBuilder<CreateMeetupCubit, CreateMeetupState>(
              buildWhen: (previous, current) =>
                  previous.timeChosen != current.timeChosen,
              builder: (context, state) {
                return Text(
                  formatDate(state.timeChosen, [HH, ':', nn, ':', ss]),
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                );
              },
            ))
      ],
    );
  }
}

class _DurationMeetUp extends StatelessWidget {
  const _DurationMeetUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          "Duration in minute: ",
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontWeight: FontWeight.w300,
              ),
        ),
        SizedBox(width: 20.w),
        Container(
          height: 64.h,
          width: 60.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFAFB1B6),
            ),
          ),
          child: BlocBuilder<CreateMeetupCubit, CreateMeetupState>(
            buildWhen: (previous, current) =>
                previous.durationChosen != current.durationChosen,
            builder: (context, state) {
              return TextFormField(
                initialValue: "120",
                onChanged: (value) => context
                    .read<CreateMeetupCubit>()
                    .durationChosenChanged(value),
                decoration: const InputDecoration(),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CreateMeetingButton extends StatelessWidget {
  const _CreateMeetingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(
            side: BorderSide(width: 1),
            borderRadius: BorderRadius.all(Radius.zero)),
        primary: const Color(0xFF1C1C1E),
        backgroundColor: Colors.white,
        textStyle: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        context.read<CreateMeetupCubit>().create();
      },
      child: Container(
        alignment: Alignment.center,
        width: 250.w,
        height: 40.h,
        child: const AutoSizeText("Create Meet-Up"),
      ),
    );
  }
}

class _DateMeetUp extends StatelessWidget {
  const _DateMeetUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          "Date: ",
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontWeight: FontWeight.w300,
              ),
        ),
        TextButton(
            style: TextButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.black, width: 1, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            onPressed: () {
              DatePicker.showDatePicker(
                context,
                showTitleActions: true,
                minTime: DateTime.now(),
                maxTime: DateTime.now().add(const Duration(days: 30)),
                onConfirm: (date) {
                  context.read<CreateMeetupCubit>().dateChosenChanged(date);
                },
                currentTime: DateTime.now(),
                locale: LocaleType.vi,
              );
            },
            child: BlocBuilder<CreateMeetupCubit, CreateMeetupState>(
              buildWhen: (previous, current) =>
                  previous.dateChosen != current.dateChosen,
              builder: (context, state) {
                return Text(
                  formatDate(state.dateChosen, [dd, '-', D, '-', M, '-', yyyy]),
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                );
              },
            ))
      ],
    );
  }
}

class _MeetUpNameInput extends StatelessWidget {
  const _MeetUpNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width: 352.w,
      alignment: Alignment.center,
      decoration: inputBoxDecoration,
      child: BlocBuilder<CreateMeetupCubit, CreateMeetupState>(
        buildWhen: (previous, current) => previous.name != current.name,
        builder: (context, state) {
          return TextFormField(
            onChanged: (value) =>
                context.read<CreateMeetupCubit>().nameChanged(value),
            decoration: const InputDecoration(hintText: "MeetUp Name"),
          );
        },
      ),
    );
  }
}

class _MeetUpLocationInput extends StatelessWidget {
  const _MeetUpLocationInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width: 352.w,
      alignment: Alignment.center,
      decoration: inputBoxDecoration,
      child: BlocBuilder<CreateMeetupCubit, CreateMeetupState>(
        buildWhen: (previous, current) => previous.location != current.location,
        builder: (context, state) {
          return TextFormField(
            onChanged: (value) =>
                context.read<CreateMeetupCubit>().locationChanged(value),
            decoration: const InputDecoration(hintText: "Location"),
          );
        },
      ),
    );
  }
}

class _MeetUpLocationAddressInput extends StatelessWidget {
  const _MeetUpLocationAddressInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width: 352.w,
      alignment: Alignment.center,
      decoration: inputBoxDecoration,
      child: BlocBuilder<CreateMeetupCubit, CreateMeetupState>(
        buildWhen: (previous, current) =>
            previous.locationAddress != current.locationAddress,
        builder: (context, state) {
          return TextFormField(
            onChanged: (value) =>
                context.read<CreateMeetupCubit>().locationAddressChanged(value),
            decoration: const InputDecoration(hintText: "Address"),
          );
        },
      ),
    );
  }
}


// class _MeetUpCodeInput extends StatelessWidget {
//   const _MeetUpCodeInput({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 64.h,
//       width: 352.w,
//       alignment: Alignment.center,
//       decoration: inputBoxDecoration,
//       child: BlocBuilder<CreateMeetupCubit, CreateMeetupState>(
//         buildWhen: (previous, current) => previous.code != current.code,
//         builder: (context, state) {
//           return TextFormField(
//             onChanged: (value) =>
//                 context.read<CreateMeetupCubit>().codeChanged(value),
//             decoration: const InputDecoration(hintText: "MeetUp Code"),
//           );
//         },
//       ),
//     );
//   }
// }

// class _MeetUpCreateButton extends StatelessWidget {
//   const _MeetUpCreateButton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       style: TextButton.styleFrom(
//         elevation: 0,
//         shape: const RoundedRectangleBorder(
//             side: BorderSide(width: 1),
//             borderRadius: BorderRadius.all(Radius.zero)),
//         primary: const Color(0xFF1C1C1E),
//         backgroundColor: Colors.white,
//         textStyle: Theme.of(context)
//             .textTheme
//             .bodyText1
//             ?.copyWith(fontWeight: FontWeight.bold),
//       ),
//       onPressed: () => context.read<CreateMeetupCubit>().create(),
//       child: Container(
//         alignment: Alignment.center,
//         width: 250.w,
//         height: 40.h,
//         child: const AutoSizeText("Create MeetUp"),
//       ),
//     );
//   }
// }
