import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_final/data/models/app_user.dart';

class MeetUpRepository {
  final FirebaseDatabase rtdb = FirebaseDatabase.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var currentUser = AppUser.empty;

  MeetUpRepository() {
    FirebaseAuth.instance.authStateChanges().listen((User? firebaseUser) {
      currentUser =
          firebaseUser == null ? AppUser.empty : firebaseUser.toAppUser;
    });
  }
}
