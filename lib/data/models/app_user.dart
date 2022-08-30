import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppUser extends Equatable {
  final String? email;
  final String id;
  final String? name;
  final String? phone;
  final String? photo;
  final String? token;

  const AppUser({
    required this.id,
    this.email = '',
    this.token = '',
    this.photo = '',
    this.name = '',
    this.phone = '',
  });

  static const empty = AppUser(id: '');

  bool get isEmpty => this == AppUser.empty;
  bool get isNotEmpty => this != AppUser.empty;

  @override
  List<Object?> get props => [email, id, name, photo, phone];
}

extension ToAppUser on User {
  AppUser get toAppUser {
    return AppUser(
      id: uid,
      email: email,
      name: displayName,
      photo: photoURL,
    );
  }
}
