import 'package:equatable/equatable.dart';
import 'package:mobile_final/data/models/app_user.dart';

class Club extends Equatable {
  final String name;
  final String code;
  final AppUser creator;
  final List<AppUser> members;
  final String inviteCode;

  const Club({
    required this.name,
    required this.code,
    required this.creator,
    required this.members,
    required this.inviteCode,
  });

  static const empty = Club(
    name: '',
    code: '',
    creator: AppUser.empty,
    members: [],
    inviteCode: '',
  );

  factory Club.fromJson(Map<String, dynamic> json) => Club(
        name: json['name'],
        code: json['code'],
        creator: AppUser.fromJson(json['creator']),
        members: List<AppUser>.from(
          json['members'].map(
            (rawUser) => AppUser.fromJson(rawUser),
          ),
        ),
        inviteCode: json['inviteCode'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['code'] = code;
    data['creator'] = creator;
    data['members'] = members;
    data['inviteCode'] = inviteCode;
    return data;
  }

  @override
  List<Object?> get props => [
        name,
        code,
        creator,
        members,
        inviteCode,
      ];
}
