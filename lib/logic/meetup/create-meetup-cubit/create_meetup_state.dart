part of 'create_meetup_cubit.dart';

enum CreateMeetupStatus { initial, submitting, success, error }

class CreateMeetupState extends Equatable {
  const CreateMeetupState({
    required this.clubCode,
    required this.name,
    required this.startTime,
    required this.endTime,
    this.status = CreateMeetupStatus.initial,
    this.errorStatus = '',
  });

  factory CreateMeetupState.initial() {
    return CreateMeetupState(
      clubCode: '',
      name: '',
      startTime: DateTime.now().add(const Duration(days: 1)),
      endTime: DateTime.now().add(
        const Duration(days: 1, hours: 2),
      ),
    );
  }

  final String clubCode;
  final String name;
  final DateTime startTime;
  final DateTime endTime;
  final String errorStatus;
  final CreateMeetupStatus status;

  CreateMeetupState copyWith({
    String? clubCode,
    String? name,
    DateTime? startTime,
    DateTime? endTime,
    String? errorStatus,
    CreateMeetupStatus? status,
  }) {
    return CreateMeetupState(
      clubCode: clubCode ?? this.clubCode,
      name: name ?? this.name,
      status: status ?? this.status,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      errorStatus: errorStatus ?? this.errorStatus,
    );
  }

  @override
  List<Object> get props => [
        errorStatus,
        status,
        clubCode,
        name,
        startTime,
        endTime,
      ];
}



// "clubCode": "seno",
//     "name": "Kèo",
//     "startTime": 1660973400,
//     "endTime": 1660980600