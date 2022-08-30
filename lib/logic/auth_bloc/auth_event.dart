part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoggedInEvent extends AuthEvent {
  final AppUser user;

  const LoggedInEvent({required this.user});

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'LoggedIn { user: ${user.email} }';
}

class LoggedOutEvent extends AuthEvent {}
