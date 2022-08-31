part of 'club_join_cubit.dart';

enum JoinClubStatus { initial, submitting, success, error }

class JoinClubState extends Equatable {
  const JoinClubState({
    required this.code,
    required this.status,
    this.errorStatus = '',
  });

  factory JoinClubState.initial() {
    return const JoinClubState(
      code: '',
      status: JoinClubStatus.initial,
    );
  }

  final String code;
  final String errorStatus;
  final JoinClubStatus status;

  JoinClubState copyWith({
    String? code,
    String? errorStatus,
    JoinClubStatus? status,
  }) {
    return JoinClubState(
      code: code ?? this.code,
      status: status ?? this.status,
      errorStatus: errorStatus ?? this.errorStatus,
    );
  }

  @override
  List<Object> get props => [
        errorStatus,
        status,
        code,
      ];
}



// "clubCode": "seno",
//     "name": "Kèo",
//     "startTime": 1660973400,
//     "endTime": 1660980600
