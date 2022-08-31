import 'package:equatable/equatable.dart';
import 'package:mobile_final/data/models/app_user.dart';

class Notification extends Equatable {
  final String action;
  final AppUser creator;
  final String meetup;
  final bool read;

  const Notification({
    required this.action,
    required this.creator,
    required this.meetup,
    required this.read,
  });

  static const empty =
      Notification(action: '', creator: AppUser.empty, meetup: '', read: false);

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        action: json['action'],
        creator: AppUser.fromJson(json['creator']),
        meetup: json['meetup'],
        read: json['read'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['action'] = action;
    data['creator'] = creator;
    data['meetup'] = meetup;
    data['read'] = read;
    return data;
  }

  @override
  List<Object?> get props => [
        action,
        creator,
        meetup,
        read,
      ];
}
