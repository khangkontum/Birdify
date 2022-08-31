part of 'create_meetup_cubit.dart';

enum CreateMeetupStatus { initial, submitting, success, error }

class CreateMeetupState extends Equatable {
  const CreateMeetupState({
    required this.name,
    required this.location,
    required this.locationAddress,
    required this.dateChosen,
    required this.timeChosen,
    required this.durationChosen,
    this.status = CreateMeetupStatus.initial,
    this.errorStatus = '',
  });

  factory CreateMeetupState.initial() {
    return CreateMeetupState(
      name: '',
      location: '',
      locationAddress: '',
      dateChosen: DateTime.now(),
      timeChosen: DateTime.now().add(
        const Duration(hours: 2),
      ),
      durationChosen: const Duration(hours: 2),
    );
  }

  final String name;
  final String location;
  final String locationAddress;
  final DateTime dateChosen;
  final DateTime timeChosen;
  final Duration durationChosen;
  final String errorStatus;
  final CreateMeetupStatus status;

  CreateMeetupState copyWith({
    String? clubCode,
    String? name,
    String? location,
    String? locationAddress,
    DateTime? dateChosen,
    DateTime? timeChosen,
    Duration? durationChosen,
    String? errorStatus,
    CreateMeetupStatus? status,
  }) {
    return CreateMeetupState(
      name: name ?? this.name,
      location: location ?? this.location,
      locationAddress: locationAddress ?? this.locationAddress,
      status: status ?? this.status,
      durationChosen: durationChosen ?? this.durationChosen,
      dateChosen: dateChosen ?? this.dateChosen,
      timeChosen: timeChosen ?? this.timeChosen,
      errorStatus: errorStatus ?? this.errorStatus,
    );
  }

  @override
  List<Object> get props => [
        errorStatus,
        status,
        name,
        location,
        locationAddress,
        dateChosen,
        timeChosen,
        durationChosen
      ];
}



// "clubCode": "seno",
//     "name": "Kèo",
//     "startTime": 1660973400,
//     "endTime": 1660980600
