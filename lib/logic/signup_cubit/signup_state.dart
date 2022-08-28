part of 'signup_cubit.dart';

enum SignupStatus { initial, submitting, success, error }

class SignupState extends Equatable {
  const SignupState({
    required this.email,
    required this.password,
    required this.status,
    required this.fullName,
    this.errorStatus = '',
  });

  final String email;
  final String password;
  final String fullName;
  final SignupStatus status;
  final String errorStatus;

  factory SignupState.initial() {
    return const SignupState(
      email: '',
      password: '',
      fullName: '',
      status: SignupStatus.initial,
    );
  }

  SignupState copyWith({
    String? email,
    String? password,
    String? fullName,
    SignupStatus? status,
    String? errorStatus,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
      status: status ?? this.status,
      errorStatus: errorStatus ?? this.errorStatus,
    );
  }

  @override
  List<Object> get props => [email, password, status];
}

// class SignupInitial extends SignupState {}
