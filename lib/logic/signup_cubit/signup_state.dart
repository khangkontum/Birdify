part of 'signup_cubit.dart';

enum SignupStatus { initial, submitting, success, error }

class SignupState extends Equatable {
  const SignupState({
    required this.email,
    required this.password,
    required this.status,
    this.errorStatus = '',
  });

  final String email;
  final String password;
  final SignupStatus status;
  final String errorStatus;

  factory SignupState.initial() {
    return const SignupState(
      email: '',
      password: '',
      status: SignupStatus.initial,
    );
  }

  SignupState copyWith({
    String? email,
    String? password,
    SignupStatus? status,
    String? errorStatus,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorStatus: errorStatus ?? this.errorStatus,
    );
  }

  @override
  List<Object> get props => [email, password, status];
}

// class SignupInitial extends SignupState {}
