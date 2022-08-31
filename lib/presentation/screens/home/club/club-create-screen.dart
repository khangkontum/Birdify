import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_final/data/repositories/api_repository.dart';
import 'package:mobile_final/logic/club/cubit/club_create_cubit.dart';
import 'package:mobile_final/presentation/common/birdify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_final/presentation/common/input_box_decoration.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:get/get.dart';

class ClubCreateScreen extends StatelessWidget {
  const ClubCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateClubCubit(context.read<ApiRepository>()),
      child: SafeArea(
          child: Scaffold(
        appBar: Birdify.appbar(),
        body: Center(
          child: BlocListener<CreateClubCubit, CreateClubState>(
            listener: (context, state) {
              if (state.status == CreateClubStatus.submitting) {
                context.loaderOverlay.show();
              }
              if (state.status == CreateClubStatus.error) {
                context.loaderOverlay.hide();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: AutoSizeText(state.errorStatus)),
                );
              }
              if (state.status == CreateClubStatus.success) {
                context.loaderOverlay.hide();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: AutoSizeText("Create Club Success"),
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
          "Create New Club",
          style: Theme.of(context).textTheme.headline2?.copyWith(
                fontWeight: FontWeight.w800,
              ),
        ),
        SizedBox(height: 42.h),
        const _ClubNameInput(),
        SizedBox(height: 25.h),
        const _ClubCodeInput(),
        SizedBox(height: 30.h),
        const _ClubCreateButton()
      ],
    );
  }
}

class _ClubNameInput extends StatelessWidget {
  const _ClubNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width: 352.w,
      alignment: Alignment.center,
      decoration: inputBoxDecoration,
      child: BlocBuilder<CreateClubCubit, CreateClubState>(
        buildWhen: (previous, current) => previous.name != current.name,
        builder: (context, state) {
          return TextFormField(
            onChanged: (value) =>
                context.read<CreateClubCubit>().nameChanged(value),
            decoration: const InputDecoration(hintText: "Club Name"),
          );
        },
      ),
    );
  }
}

class _ClubCodeInput extends StatelessWidget {
  const _ClubCodeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width: 352.w,
      alignment: Alignment.center,
      decoration: inputBoxDecoration,
      child: BlocBuilder<CreateClubCubit, CreateClubState>(
        buildWhen: (previous, current) => previous.code != current.code,
        builder: (context, state) {
          return TextFormField(
            onChanged: (value) =>
                context.read<CreateClubCubit>().codeChanged(value),
            decoration: const InputDecoration(hintText: "Club Code"),
          );
        },
      ),
    );
  }
}

class _ClubCreateButton extends StatelessWidget {
  const _ClubCreateButton({Key? key}) : super(key: key);

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
      onPressed: () => context.read<CreateClubCubit>().create(),
      child: Container(
        alignment: Alignment.center,
        width: 250.w,
        height: 40.h,
        child: const AutoSizeText("Create Club"),
      ),
    );
  }
}
