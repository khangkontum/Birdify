import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_final/data/repositories/api_repository.dart';

part 'create_meetup_state.dart';

class CreateMeetupCubit extends Cubit<CreateMeetupState> {
  final ApiRepository apiRepository;
  final String clubCode;

  CreateMeetupCubit({required this.apiRepository, required this.clubCode})
      : super(CreateMeetupState.initial());

  void nameChanged(String value) {
    emit(state.copyWith(
      name: value,
      status: CreateMeetupStatus.initial,
    ));
  }

  void locationChanged(String value) {
    emit(state.copyWith(
      location: value,
      status: CreateMeetupStatus.initial,
    ));
  }

  void locationAddressChanged(String value) {
    emit(state.copyWith(
      locationAddress: value,
      status: CreateMeetupStatus.initial,
    ));
  }

  void dateChosenChanged(DateTime value) {
    emit(state.copyWith(
      dateChosen: value,
      status: CreateMeetupStatus.initial,
    ));
  }

  void durationChosenChanged(String value) {
    var duration = int.parse(value);
    emit(state.copyWith(
      durationChosen: Duration(minutes: duration),
      status: CreateMeetupStatus.initial,
    ));
  }

  void timeChosenChanged(DateTime value) {
    emit(state.copyWith(
      timeChosen: value,
      status: CreateMeetupStatus.initial,
    ));
  }

  Future<void> create() async {
    if (state.status == CreateMeetupStatus.submitting) return;
    try {
      emit(state.copyWith(status: CreateMeetupStatus.submitting));

      final startTime = DateTime(
          state.dateChosen.year,
          state.dateChosen.month,
          state.dateChosen.day,
          state.timeChosen.hour,
          state.timeChosen.minute,
          state.timeChosen.second);

      final endTime = startTime.add(state.durationChosen);

      await apiRepository.request(
        postfix: '/meetup/create',
        method: 'POST',
        data: {
          'clubCode': clubCode,
          'name': state.name,
          'location': state.location,
          'location_address': state.locationAddress,
          'startTime': startTime.millisecondsSinceEpoch,
          'endTime': endTime.millisecondsSinceEpoch
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
