part of 'meetup_detail_cubit.dart';

enum DetailMeetUpStatus { initial, submitting, success, error }

class DetailMeetUpState extends Equatable {
  const DetailMeetUpState({
    required this.meetUp,
    required this.status,
    this.errorStatus = '',
  });

  factory DetailMeetUpState.initial() {
    return DetailMeetUpState(
      meetUp: MeetUp.empty,
      errorStatus: '',
      status: DetailMeetUpStatus.initial,
    );
  }

  final MeetUp meetUp;
  final String errorStatus;
  final DetailMeetUpStatus status;

  DetailMeetUpState copyWith({
    MeetUp? meetUp,
    String? errorStatus,
    DetailMeetUpStatus? status,
  }) {
    return DetailMeetUpState(
      meetUp: meetUp ?? this.meetUp,
      status: status ?? this.status,
      errorStatus: errorStatus ?? this.errorStatus,
    );
  }

  @override
  List<Object> get props => [
        errorStatus,
        status,
        meetUp,
      ];
}



// "MeetUpCode": "seno",
//     "name": "Kèo",
//     "startTime": 1660973400,
//     "endTime": 1660980600
