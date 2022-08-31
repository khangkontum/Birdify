part of 'club_create_cubit.dart';

enum CreateClubStatus { initial, submitting, success, error }

class CreateClubState extends Equatable {
  const CreateClubState({
    required this.code,
    required this.name,
    required this.status,
    this.errorStatus = '',
  });

  factory CreateClubState.initial() {
    return const CreateClubState(
      code: '',
      name: '',
      status: CreateClubStatus.initial,
    );
  }

  final String code;
  final String name;
  final String errorStatus;
  final CreateClubStatus status;

  CreateClubState copyWith({
    String? code,
    String? name,
    String? errorStatus,
    CreateClubStatus? status,
  }) {
    return CreateClubState(
      code: code ?? this.code,
      name: name ?? this.name,
      status: status ?? this.status,
      errorStatus: errorStatus ?? this.errorStatus,
    );
  }

  @override
  List<Object> get props => [
        errorStatus,
        status,
        code,
        name,
      ];
}



// "clubCode": "seno",
//     "name": "Kèo",
//     "startTime": 1660973400,
//     "endTime": 1660980600