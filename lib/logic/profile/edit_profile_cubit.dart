import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_final/data/repositories/api_repository.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final ApiRepository apiRepository;

  EditProfileCubit(this.apiRepository) : super(EditProfileState.initial());

  void nameChanged(String value) {
    emit(state.copyWith(
      name: value,
      status: EditProfileStatus.initial,
    ));
  }

  void locationChanged(String value) {
    emit(state.copyWith(
      location: value,
      status: EditProfileStatus.initial,
    ));
  }

  Future<void> edit() async {
    if (state.status == EditProfileStatus.submitting) return;
    try {
      emit(state.copyWith(status: EditProfileStatus.submitting));

      await apiRepository.request(
        postfix: '/auth/edit',
        method: 'POST',
        data: {
          'name': state.name,
          'location': state.location,
        },
      );
      emit(state.copyWith(status: EditProfileStatus.success));
    } on DioError catch (e) {
      emit(
        state.copyWith(
          status: EditProfileStatus.error,
          errorStatus: e.message,
        ),
      );
    } catch (e) {
      print(e);
    }
  }
}
