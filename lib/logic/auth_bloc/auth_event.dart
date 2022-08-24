part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoadAuthEvent extends AuthEvent {}

class SignedInEvent extends AuthEvent {
  final User user;

  const SignedInEvent({required this.user});

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'LoggedIn { user: ${user.email} }';
}

class SignedOut extends AuthEvent {}
