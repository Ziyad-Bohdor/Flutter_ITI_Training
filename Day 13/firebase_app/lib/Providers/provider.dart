import 'package:firebase_app/Controller/auth-controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final AuthController authController;

  AuthProvider({
    required this.authController,
  });

  User? user;

  bool isLoading = false;

  String? errorMessage;

  String? username;

  String? email;

  bool get isLoggedIn {
    return user != null;
  }

  // Sign Up
  Future<void> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    isLoading = true;
    errorMessage = null;

    notifyListeners();

    try {
      final credential = await authController.signUp(
        email: email,
        password: password,
      );

      user = credential.user;

      await authController.addUserToFirestore(
        uid: user!.uid,
        username: username,
        email: email,
      );

      this.username = username;
      this.email = email;
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message;
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;

    notifyListeners();
  }

  // Sign In
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading = true;
    errorMessage = null;

    notifyListeners();

    try {
      final credential = await authController.signIn(
        email: email,
        password: password,
      );

      user = credential.user;

      final data =
          await authController.getUser(user!.uid);

      if (data.exists) {
        final userData = data.data();

        username = userData?["username"];
        this.email = userData?["email"];
      }
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message;
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;

    notifyListeners();
  }

  // Logout
  Future<void> logout() async {
    await authController.logout();

    user = null;
    username = null;
    email = null;

    notifyListeners();
  }
}