import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_final/data/models/app_user.dart';
import 'package:mobile_final/data/repositories/api_repository.dart';

part 'profile_detail_state.dart';

class DetailProfileCubit extends Cubit<DetailProfileState> {
  final ApiRepository apiRepository;

  DetailProfileCubit({
    required this.apiRepository,
  }) : super(DetailProfileState.initial()) {
    detail();
  }

  Future<void> detail() async {
    if (state.status == DetailProfileStatus.submitting) return;

    if (state.status == DetailProfileStatus.initial) {
      try {
        emit(state.copyWith(status: DetailProfileStatus.submitting));

        var response = await apiRepository.request(
          postfix: '/auth/info',
          method: 'GET',
        );

        emit(
          state.copyWith(
            status: DetailProfileStatus.success,
            user: AppUser(
              id: response.data['user']['uid'],
              name: response.data['user']['name'],
              email: response.data['user']['email'],
              photo: response.data['user']['avatar'],
              location: response.data['user']['location'],
              attendedMeetups: response.data['stats']['attendedMeetups'],
              totalPaid: response.data['stats']['totalPaid'],
              totalUnpaid: response.data['stats']['totalUnpaid'],
            ),
          ),
        );
      } on DioError catch (e) {
        emit(
          state.copyWith(
            status: DetailProfileStatus.error,
            errorStatus: e.message,
          ),
        );
      } catch (e) {
        print(e);
      }
    }
  }
}
