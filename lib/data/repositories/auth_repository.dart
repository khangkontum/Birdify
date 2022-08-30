import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_final/data/models/app_user.dart';
import 'package:mobile_final/data/providers/auth_google_provider.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  var currentUser = AppUser.empty;

  Future<String?> get token => _firebaseAuth.currentUser!.getIdToken();

  bool get isLoggedIn =>
      _firebaseAuth.currentUser != null &&
      _firebaseAuth.currentUser?.getIdToken() != null;

  Stream<AppUser> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user =
          firebaseUser == null ? AppUser.empty : firebaseUser.toAppUser;
      currentUser = user;
      return user;
    });
  }

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  Stream<User?> get idTokenChange => _firebaseAuth.idTokenChanges();

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

  Future<void> loginViaGoogle() async {
    await signInWithGoogle();
  }
}
