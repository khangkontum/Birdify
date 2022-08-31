import 'package:equatable/equatable.dart';

class Club extends Equatable {
  final String sId;
  final String name;
  final String code;
  final String creator;
  final List<String> members;
  final String inviteCode;

  const Club({
    required this.sId,
    required this.name,
    required this.code,
    required this.creator,
    required this.members,
    required this.inviteCode,
  });

  static const empty = Club(
    sId: '',
    name: '',
    code: '',
    creator: '',
    members: [],
    inviteCode: '',
  );

  factory Club.fromJson(Map<String, dynamic> json) => Club(
        sId: json['_id'],
        name: json['name'],
        code: json['code'],
        creator: json['creator'],
        members: json['members'].cast<String>(),
        inviteCode: json['inviteCode'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['code'] = code;
    data['creator'] = creator;
    data['members'] = members;
    data['inviteCode'] = inviteCode;
    return data;
  }

  @override
  List<Object?> get props => [
        sId,
        name,
        code,
        creator,
        members,
        inviteCode,
      ];
}
