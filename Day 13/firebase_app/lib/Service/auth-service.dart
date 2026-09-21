import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/Model/model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  // Sign Up
  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    final credential =
        await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return credential;
  }

  // Sign In
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    final credential =
        await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return credential;
  }

  // Add User To Firestore
  Future<void> addUserToFirestore({
    required String uid,
    required String username,
    required String email,
  }) async {
    final user = UserModel(
      uid: uid,
      username: username,
      email: email,
    );

    await _firestore
        .collection("Users")
        .doc(uid)
        .set(user.toMap());
  }

  // Get User From Firestore
  Future<DocumentSnapshot<Map<String, dynamic>>> getUser(
      String uid) async {
    return await _firestore
        .collection("Users")
        .doc(uid)
        .get();
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
  }
}