import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_final/data/models/app_user.dart';

class MeetUpRepository {
  var currentUser = AppUser.empty;

  MeetUpRepository() {
    FirebaseAuth.instance.authStateChanges().listen((User? firebaseUser) {
      currentUser =
          firebaseUser == null ? AppUser.empty : firebaseUser.toAppUser;
    });
  }
}
