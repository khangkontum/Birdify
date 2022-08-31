import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_final/data/models/meetup.dart';
import 'package:mobile_final/data/repositories/api_repository.dart';

part 'meetup_listing_state.dart';

class ListingmeetupCubit extends Cubit<ListingMeetUpState> {
  final ApiRepository apiRepository;

  ListingmeetupCubit(
    this.apiRepository,
  ) : super(ListingMeetUpState.initial()) {
    listing();
  }

  Future<void> listing() async {
    if (state.status == ListingMeetUpStatus.submitting) return;

    if (state.status == ListingMeetUpStatus.initial) {
      try {
        emit(state.copyWith(status: ListingMeetUpStatus.submitting));

        var response = await apiRepository.request(
          postfix: '/meetup/list-attended',
          method: 'GET',
        );

        emit(
          state.copyWith(
            status: ListingMeetUpStatus.success,
            meetUps: List<MeetUp>.from(
              response.data['meetups'].map(
                (rawMeetUp) => MeetUp.fromJson(rawMeetUp),
              ),
            ),
          ),
        );
      } on DioError catch (e) {
        emit(
          state.copyWith(
            status: ListingMeetUpStatus.error,
            errorStatus: e.message,
          ),
        );
      } catch (e) {
        print(e);
      }
    }
  }
}
