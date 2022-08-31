import 'package:equatable/equatable.dart';
import 'package:mobile_final/data/models/app_user.dart';

class MeetUp extends Equatable {
  final String code;
  final String clubCode;
  final String name;
  final DateTime startTime;
  final DateTime endTime;
  final AppUser creator;
  final List<AppUser> participants;
  // final String? payment;
  final String status;

  const MeetUp({
    required this.code,
    required this.clubCode,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.creator,
    required this.participants,
    required this.status,
    // this.payment = '',
  });

  static final empty = MeetUp(
    code: '',
    clubCode: '',
    name: '',
    startTime: DateTime.now(),
    endTime: DateTime.now(),
    creator: AppUser.empty,
    participants: const [],
    // payment: '',
    status: '',
  );

  factory MeetUp.fromJson(Map<String, dynamic> json) => MeetUp(
        code: json['code'],
        clubCode: json['clubCode'],
        name: json['name'],
        startTime: DateTime.fromMillisecondsSinceEpoch(json['startTime']),
        endTime: DateTime.fromMillisecondsSinceEpoch(json['endTime']),
        creator: AppUser.fromJson(json['creator']),
        status: json['status'],
        participants: List<AppUser>.from(
          json['participants'].map(
            (rawUser) => AppUser.fromJson(rawUser),
          ),
        ),
      );

  @override
  List<Object?> get props => [
        code,
        clubCode,
        status,
        name,
        startTime,
        endTime,
        creator,
        participants,
      ];
}
