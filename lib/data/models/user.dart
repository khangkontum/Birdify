import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? email;
  final String id;
  final String? name;
  final String? phone;
  final String? photo;
  final String? token;

  const User({
    required this.id,
    this.email = '',
    this.token = '',
    this.photo = '',
    this.name = '',
    this.phone = '',
  });

  static const empty = User(id: '');

  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [email, id, name, photo, phone];
}
