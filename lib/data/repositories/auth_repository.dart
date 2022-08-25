import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:mobile_final/data/models/user.dart';

class AuthRepository {
  final firebase.FirebaseAuth _firebaseAuth = firebase.FirebaseAuth.instance;

  var currentUser = User.empty;

  Future<String?> get token => _firebaseAuth.currentUser!.getIdToken();

  bool get isLoggedIn =>
      _firebaseAuth.currentUser != null &&
      _firebaseAuth.currentUser?.getIdToken() != null;

  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      currentUser = user;
      return user;
    });
  }

  Stream<firebase.User?> get authStateChanges =>
      _firebaseAuth.authStateChanges();
  Stream<firebase.User?> get idTokenChange => _firebaseAuth.idTokenChanges();

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

extension on firebase.User {
  User get toUser {
    return User(
      id: uid,
      email: email,
      name: displayName,
      photo: photoURL,
    );
  }
}
