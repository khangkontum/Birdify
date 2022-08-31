part of 'meetup_listing_cubit.dart';

enum ListingMeetUpStatus { initial, submitting, success, error }

class ListingMeetUpState extends Equatable {
  const ListingMeetUpState({
    required this.meetUps,
    required this.status,
    this.errorStatus = '',
  });

  factory ListingMeetUpState.initial() {
    return ListingMeetUpState(
      meetUps: [MeetUp.empty],
      errorStatus: '',
      status: ListingMeetUpStatus.initial,
    );
  }

  final List<MeetUp> meetUps;
  final String errorStatus;
  final ListingMeetUpStatus status;

  ListingMeetUpState copyWith({
    List<MeetUp>? meetUps,
    String? errorStatus,
    ListingMeetUpStatus? status,
  }) {
    return ListingMeetUpState(
      meetUps: meetUps ?? this.meetUps,
      status: status ?? this.status,
      errorStatus: errorStatus ?? this.errorStatus,
    );
  }

  @override
  List<Object> get props => [
        errorStatus,
        status,
        meetUps,
      ];
}



// "MeetUpCode": "seno",
//     "name": "Kèo",
//     "startTime": 1660973400,
//     "endTime": 1660980600