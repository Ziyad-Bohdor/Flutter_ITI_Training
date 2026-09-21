import 'package:firebase_app/Controller/auth-controller.dart';
import 'package:firebase_app/Providers/provider.dart';
import 'package:firebase_app/Screens/login.dart';
import 'package:firebase_app/Service/auth-service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final authService = AuthService();

  final authController = AuthController(
    authService: authService,
  );

  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthProvider(
        authController: authController,
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}