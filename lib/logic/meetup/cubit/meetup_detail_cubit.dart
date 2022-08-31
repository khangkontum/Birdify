import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_final/data/models/meetup.dart';
import 'package:mobile_final/data/repositories/api_repository.dart';

part 'meetup_detail_state.dart';

class DetailMeetUpCubit extends Cubit<DetailMeetUpState> {
  final ApiRepository apiRepository;
  final String meetUpId;
  final String clubCode;

  DetailMeetUpCubit({
    required this.apiRepository,
    required this.meetUpId,
    required this.clubCode,
  }) : super(DetailMeetUpState.initial()) {
    detail();
  }

  Future<void> detail() async {
    if (state.status == DetailMeetUpStatus.submitting) return;

    if (state.status == DetailMeetUpStatus.initial) {
      try {
        emit(state.copyWith(status: DetailMeetUpStatus.submitting));

        var response = await apiRepository.request(
          postfix: '/meetup/get/$clubCode/$meetUpId',
          method: 'GET',
        );

        emit(
          state.copyWith(
              status: DetailMeetUpStatus.success,
              meetUp: MeetUp.fromJson(response.data['meetup'])),
        );
      } on DioError catch (e) {
        emit(
          state.copyWith(
            status: DetailMeetUpStatus.error,
            errorStatus: e.message,
          ),
        );
      } catch (e) {
        print(e);
      }
    }
  }
}
