import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_final/data/repositories/api_repository.dart';
import 'package:mobile_final/logic/profile/edit_profile_cubit.dart';
import 'package:mobile_final/presentation/common/birdify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_final/presentation/common/input_box_decoration.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:get/get.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit(context.read<ApiRepository>()),
      child: SafeArea(
          child: Scaffold(
        appBar: Birdify.appbar(),
        body: Center(
          child: BlocListener<EditProfileCubit, EditProfileState>(
            listener: (context, state) {
              if (state.status == EditProfileStatus.submitting) {
                context.loaderOverlay.show();
              }
              if (state.status == EditProfileStatus.error) {
                context.loaderOverlay.hide();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: AutoSizeText(state.errorStatus)),
                );
              }
              if (state.status == EditProfileStatus.success) {
                context.loaderOverlay.hide();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: AutoSizeText("Edit profile successful"),
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
          "Edit Profile",
          style: Theme.of(context).textTheme.headline2?.copyWith(
                fontWeight: FontWeight.w800,
              ),
        ),
        SizedBox(height: 42.h),
        const _ProfileNameInput(),
        SizedBox(height: 25.h),
        const _ProfileLocationInput(),
        SizedBox(height: 30.h),
        const _ProfileEditButton()
      ],
    );
  }
}

class _ProfileNameInput extends StatelessWidget {
  const _ProfileNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width: 352.w,
      alignment: Alignment.center,
      decoration: inputBoxDecoration,
      child: BlocBuilder<EditProfileCubit, EditProfileState>(
        buildWhen: (previous, current) => previous.name != current.name,
        builder: (context, state) {
          return TextFormField(
            onChanged: (value) =>
                context.read<EditProfileCubit>().nameChanged(value),
            decoration: const InputDecoration(hintText: "Name"),
          );
        },
      ),
    );
  }
}

class _ProfileLocationInput extends StatelessWidget {
  const _ProfileLocationInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width: 352.w,
      alignment: Alignment.center,
      decoration: inputBoxDecoration,
      child: BlocBuilder<EditProfileCubit, EditProfileState>(
        buildWhen: (previous, current) => previous.location != current.location,
        builder: (context, state) {
          return TextFormField(
            onChanged: (value) =>
                context.read<EditProfileCubit>().locationChanged(value),
            decoration: const InputDecoration(hintText: "Location"),
          );
        },
      ),
    );
  }
}

class _ProfileEditButton extends StatelessWidget {
  const _ProfileEditButton({Key? key}) : super(key: key);

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
      onPressed: () => context.read<EditProfileCubit>().edit(),
      child: Container(
        alignment: Alignment.center,
        width: 250.w,
        height: 40.h,
        child: const AutoSizeText("Save"),
      ),
    );
  }
}
