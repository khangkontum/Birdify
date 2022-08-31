part of 'create_meetup_cubit.dart';

enum CreateMeetupStatus { initial, submitting, success, error }

class CreateMeetupState extends Equatable {
  const CreateMeetupState({
    required this.name,
    required this.dateChosen,
    required this.timeChosen,
    required this.durationChosen,
    this.status = CreateMeetupStatus.initial,
    this.errorStatus = '',
  });

  factory CreateMeetupState.initial() {
    return CreateMeetupState(
      name: '',
      dateChosen: DateTime.now().add(const Duration(days: 1)),
      timeChosen: DateTime.now().add(
        const Duration(days: 1, hours: 2),
      ),
      durationChosen: const Duration(),
    );
  }

  final String name;
  final DateTime dateChosen;
  final DateTime timeChosen;
  final Duration durationChosen;
  final String errorStatus;
  final CreateMeetupStatus status;

  CreateMeetupState copyWith({
    String? clubCode,
    String? name,
    DateTime? dateChosen,
    DateTime? timeChosen,
    Duration? durationChosen,
    String? errorStatus,
    CreateMeetupStatus? status,
  }) {
    return CreateMeetupState(
      name: name ?? this.name,
      status: status ?? this.status,
      durationChosen: durationChosen ?? this.durationChosen,
      dateChosen: dateChosen ?? this.dateChosen,
      timeChosen: timeChosen ?? this.timeChosen,
      errorStatus: errorStatus ?? this.errorStatus,
    );
  }

  @override
  List<Object> get props =>
      [errorStatus, status, name, timeChosen, durationChosen, dateChosen];
}



// "clubCode": "seno",
//     "name": "Kèo",
//     "startTime": 1660973400,
//     "endTime": 1660980600