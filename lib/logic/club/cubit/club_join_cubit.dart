import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_final/data/repositories/api_repository.dart';

part 'club_join_state.dart';

class JoinClubCubit extends Cubit<JoinClubState> {
  final ApiRepository apiRepository;

  JoinClubCubit(
    this.apiRepository,
  ) : super(JoinClubState.initial());

  void codeChanged(String value) {
    emit(state.copyWith(
      code: value,
      status: JoinClubStatus.initial,
    ));
  }

  Future<void> join() async {
    if (state.status == JoinClubStatus.submitting) return;

    if (state.status == JoinClubStatus.initial) {
      try {
        emit(state.copyWith(status: JoinClubStatus.submitting));

        await apiRepository.request(
          postfix: '/club/join',
          method: 'POST',
          data: {
            'inviteCode': state.code,
          },
        );

        emit(state.copyWith(status: JoinClubStatus.success));
      } on DioError catch (e) {
        emit(
          state.copyWith(
            status: JoinClubStatus.error,
            errorStatus: e.response?.data['message'] ?? "Unknown Error",
          ),
        );
      } catch (e) {
        print(e);
      }
    }
  }
}
