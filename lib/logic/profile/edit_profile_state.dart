part of 'edit_profile_cubit.dart';

enum EditProfileStatus { initial, submitting, success, error }

class EditProfileState extends Equatable {
  const EditProfileState({
    required this.name,
    required this.location,
    this.status = EditProfileStatus.initial,
    this.errorStatus = '',
  });

  factory EditProfileState.initial() {
    return const EditProfileState(
      name: '',
      location: '',
      errorStatus: '',
      status: EditProfileStatus.initial,
    );
  }

  final String name;
  final String location;
  final String errorStatus;
  final EditProfileStatus status;

  EditProfileState copyWith({
    String? name,
    String? location,
    String? errorStatus,
    EditProfileStatus? status,
  }) {
    return EditProfileState(
      name: name ?? this.name,
      location: location ?? this.location,
      status: status ?? this.status,
      errorStatus: errorStatus ?? this.errorStatus,
    );
  }

  @override
  List<Object> get props => [errorStatus, status, name, location];
}
