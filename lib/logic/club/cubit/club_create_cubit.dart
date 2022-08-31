import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_final/data/repositories/api_repository.dart';

part 'club_create_state.dart';

class CreateClubCubit extends Cubit<CreateClubState> {
  final ApiRepository apiRepository;

  CreateClubCubit(
    this.apiRepository,
  ) : super(CreateClubState.initial());

  void codeChanged(String value) {
    emit(state.copyWith(code: value));
  }

  void nameChanged(String value) {
    emit(state.copyWith(name: value));
  }

  Future<void> create() async {
    if (state.status == CreateClubStatus.submitting) return;

    if (state.status == CreateClubStatus.initial) {
      try {
        emit(state.copyWith(status: CreateClubStatus.submitting));

        String code = state.code.toLowerCase().replaceAll(' ', '');
        if (code.length > 20) code = code.substring(0, 20);
        String name = state.name.trim();
        if (name.length > 20) name = name.substring(0, 20);

        await apiRepository.request(
          postfix: '/club/create',
          method: 'POST',
          data: {
            'code': code,
            'name': name,
          },
        );

        emit(state.copyWith(status: CreateClubStatus.success));
      } on DioError catch (e) {
        emit(
          state.copyWith(
            status: CreateClubStatus.error,
            errorStatus: e.message,
          ),
        );
      } catch (e) {
        print(e);
      }
    }
  }
}
