import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get user => _firebaseAuth.currentUser;

  Future<String?> get token => _firebaseAuth.currentUser!.getIdToken();

  bool get isLoggedIn =>
      _firebaseAuth.currentUser != null &&
      _firebaseAuth.currentUser?.getIdToken() != null;

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
}
