import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_final/data/models/club.dart';
import 'package:mobile_final/data/repositories/api_repository.dart';

part 'club_detail_state.dart';

class DetailClubCubit extends Cubit<DetailClubState> {
  final ApiRepository apiRepository;
  final String clubCode;

  DetailClubCubit({
    required this.apiRepository,
    required this.clubCode,
  }) : super(DetailClubState.initial()) {
    detail();
  }

  Future<void> detail() async {
    if (state.status == DetailClubStatus.submitting) return;

    if (state.status == DetailClubStatus.initial) {
      try {
        emit(state.copyWith(status: DetailClubStatus.submitting));

        var response = await apiRepository.request(
          postfix: '/club/get/$clubCode',
          method: 'GET',
        );

        emit(
          state.copyWith(
              status: DetailClubStatus.success,
              club: Club.fromJson(response.data['club'])),
        );
      } on DioError catch (e) {
        emit(
          state.copyWith(
            status: DetailClubStatus.error,
            errorStatus: e.message,
          ),
        );
      } catch (e) {
        print(e);
      }
    }
  }
}
