import 'package:firebase_app/Service/auth-service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController {
  final AuthService authService;

  AuthController({
    required this.authService,
  });

  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    return await authService.signUp(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return await authService.signIn(
      email: email,
      password: password,
    );
  }

  Future<void> addUserToFirestore({
    required String uid,
    required String username,
    required String email,
  }) async {
    await authService.addUserToFirestore(
      uid: uid,
      username: username,
      email: email,
    );
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUser(
      String uid) async {
    return await authService.getUser(uid);
  }

  Future<void> logout() async {
    await authService.logout();
  }
}