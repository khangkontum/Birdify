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

  const MeetUp({
    required this.code,
    required this.clubCode,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.creator,
    required this.participants,
  });

  static final empty = MeetUp(
    code: '',
    clubCode: '',
    name: '',
    startTime: DateTime.now(),
    endTime: DateTime.now(),
    creator: AppUser.empty,
    participants: [],
  );

  factory MeetUp.fromJson(Map<String, dynamic> json) => MeetUp(
        code: json['code'],
        clubCode: json['clubCode'],
        name: json['name'],
        startTime: json['startTime'],
        endTime: json['endTime'],
        creator: AppUser.fromJson(json['creator']),
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
        name,
        startTime,
        endTime,
        creator,
        participants,
      ];
}
