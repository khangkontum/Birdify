import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_final/data/models/notification.dart';
import 'package:mobile_final/data/repositories/api_repository.dart';

part 'notification_listing_state.dart';

class ListingNotificationCubit extends Cubit<ListingNotificationState> {
  final ApiRepository apiRepository;

  ListingNotificationCubit(
    this.apiRepository,
  ) : super(ListingNotificationState.initial()) {
    listing();
  }

  Future<void> listing() async {
    if (state.status == ListingNotificationStatus.submitting) return;

    if (state.status == ListingNotificationStatus.initial) {
      try {
        emit(state.copyWith(status: ListingNotificationStatus.submitting));

        var response = await apiRepository.request(
          postfix: '/notification/list',
          method: 'GET',
        );

        var tempNotifications = <Notification>[];

        for (var rawNotification in response.data['notifications']) {
          tempNotifications.add(
            Notification.fromJson(rawNotification),
          );
        }

        emit(state.copyWith(
          status: ListingNotificationStatus.success,
          notifications: tempNotifications,
        ));
      } on DioError catch (e) {
        emit(
          state.copyWith(
            status: ListingNotificationStatus.error,
            errorStatus: e.message,
          ),
        );
      } catch (e) {
        print(e);
      }
    }
  }
}
