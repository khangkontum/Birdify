part of 'notification_listing_cubit.dart';

enum ListingNotificationStatus { initial, submitting, success, error }

class ListingNotificationState extends Equatable {
  const ListingNotificationState({
    required this.status,
    required this.notifications,
    this.errorStatus = '',
  });

  factory ListingNotificationState.initial() {
    return const ListingNotificationState(
      notifications: [Notification.empty],
      errorStatus: '',
      status: ListingNotificationStatus.initial,
    );
  }

  final List<Notification> notifications;
  final String errorStatus;
  final ListingNotificationStatus status;

  ListingNotificationState copyWith({
    List<Notification>? notifications,
    String? errorStatus,
    ListingNotificationStatus? status,
  }) {
    return ListingNotificationState(
      notifications: notifications ?? this.notifications,
      status: status ?? this.status,
      errorStatus: errorStatus ?? this.errorStatus,
    );
  }

  @override
  List<Object> get props => [
        errorStatus,
        status,
        notifications,
      ];
}
