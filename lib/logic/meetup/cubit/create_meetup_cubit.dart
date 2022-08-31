import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_final/data/repositories/api_repository.dart';

part 'create_meetup_state.dart';

class CreateMeetupCubit extends Cubit<CreateMeetupState> {
  final ApiRepository apiRepository;

  CreateMeetupCubit(
    this.apiRepository,
  ) : super(CreateMeetupState.initial());

  Future<void> create() async {
    if (state.status == CreateMeetupStatus.submitting) return;
    try {
      emit(state.copyWith(status: CreateMeetupStatus.submitting));
      await apiRepository.request(
        postfix: '/meetup/create',
        method: 'POST',
        data: {
          'clubCode': state.clubCode,
          'name': state.name,
          'startTime': state.startTime.millisecondsSinceEpoch,
          'endTime': state.endTime.millisecondsSinceEpoch
        },
      );
      emit(state.copyWith(status: CreateMeetupStatus.success));
    } on DioError catch (e) {
      emit(
        state.copyWith(
          status: CreateMeetupStatus.error,
          errorStatus: e.message,
        ),
      );
    } catch (e) {
      print(e);
    }
  }
}
