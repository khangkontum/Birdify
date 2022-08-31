part of 'notification_listing_cubit.dart';

enum ListingNotificationStatus { initial, submitting, success, error }

class ListingNotificationState extends Equatable {
  const ListingNotificationState({
    required this.status,
    required this.notifications,
    required this.uid,
    this.errorStatus = '',
  });

  factory ListingNotificationState.initial() {
    return const ListingNotificationState(
      notifications: [Notification.empty],
      uid: '',
      errorStatus: '',
      status: ListingNotificationStatus.initial,
    );
  }

  final List<Notification> notifications;
  final String uid;
  final String errorStatus;
  final ListingNotificationStatus status;

  ListingNotificationState copyWith({
    List<Notification>? notifications,
    String? uid,
    String? errorStatus,
    ListingNotificationStatus? status,
  }) {
    return ListingNotificationState(
      notifications: notifications ?? this.notifications,
      uid: uid ?? this.uid,
      status: status ?? this.status,
      errorStatus: errorStatus ?? this.errorStatus,
    );
  }

  @override
  List<Object> get props => [
        errorStatus,
        status,
        notifications,
        uid,
      ];
}
