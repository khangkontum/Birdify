part of 'profile_detail_cubit.dart';

enum DetailProfileStatus { initial, submitting, success, error }

class DetailProfileState extends Equatable {
  const DetailProfileState({
    required this.user,
    required this.status,
    this.errorStatus = '',
  });

  factory DetailProfileState.initial() {
    return const DetailProfileState(
      user: AppUser.empty,
      errorStatus: '',
      status: DetailProfileStatus.initial,
    );
  }

  final AppUser user;
  final String errorStatus;
  final DetailProfileStatus status;

  DetailProfileState copyWith({
    AppUser? user,
    String? errorStatus,
    DetailProfileStatus? status,
  }) {
    return DetailProfileState(
      user: user ?? this.user,
      status: status ?? this.status,
      errorStatus: errorStatus ?? this.errorStatus,
    );
  }

  @override
  List<Object> get props => [
        errorStatus,
        status,
        user,
      ];
}
