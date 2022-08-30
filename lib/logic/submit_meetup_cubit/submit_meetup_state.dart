part of 'submit_meetup_cubit.dart';

enum SubmitMeetupStatus {
  intial,
  submitting,
  success,
  error,
}

class SubmitMeetupState extends Equatable {
  const SubmitMeetupState({
    required this.field1,
    required this.field2,
    required this.status,
  });

  final String field1;
  final String field2;
  final SubmitMeetupStatus status;

  factory SubmitMeetupState.initial() {
    return const SubmitMeetupState(
      field1: 'def',
      field2: 'def',
      status: SubmitMeetupStatus.intial,
    );
  }

  SubmitMeetupState copyWith({
    String? field1,
    String? field2,
    SubmitMeetupStatus? status,
  }) {
    return SubmitMeetupState(
        field1: field1 ?? this.field1,
        field2: field2 ?? this.field2,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [
        field1,
        field2,
      ];
}

// class SubmitMeetupInitial extends SubmitMeetupState {}
