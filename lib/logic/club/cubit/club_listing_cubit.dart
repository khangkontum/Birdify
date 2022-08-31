import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_final/data/models/club.dart';
import 'package:mobile_final/data/repositories/api_repository.dart';

part 'club_listing_state.dart';

class ListingClubCubit extends Cubit<ListingClubState> {
  final ApiRepository apiRepository;

  ListingClubCubit(
    this.apiRepository,
  ) : super(ListingClubState.initial()) {
    listing();
  }

  Future<void> listing() async {
    if (state.status == ListingClubStatus.submitting) return;

    if (state.status == ListingClubStatus.initial) {
      try {
        emit(state.copyWith(status: ListingClubStatus.submitting));

        var response = await apiRepository.request(
          postfix: '/club/list',
          method: 'GET',
        );

        var tempClubs = <Club>[];

        for (var rawClub in response.data['clubs']) {
          tempClubs.add(
            Club.fromJson(rawClub),
          );
        }

        emit(state.copyWith(
          status: ListingClubStatus.success,
          clubs: tempClubs,
        ));
      } on DioError catch (e) {
        emit(
          state.copyWith(
            status: ListingClubStatus.error,
            errorStatus: e.message,
          ),
        );
      } catch (e) {
        print(e);
      }
    }
  }
}
