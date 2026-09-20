import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/views/home_page.dart';

import 'models/note.dart';
import 'services/hive_service.dart';
import 'services/shared_preferences_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(NoteAdapter());

  final hiveService = HiveService();
  await hiveService.init();

  final sharedPreferencesService = SharedPreferencesService();

  final isDarkMode =
      await sharedPreferencesService.getDarkMode();

  runApp(
    MyApp(
      hiveService: hiveService,
      sharedPreferencesService: sharedPreferencesService,
      isDarkMode: isDarkMode,
    ),
  );
}

class MyApp extends StatefulWidget {
  final HiveService hiveService;
  final SharedPreferencesService sharedPreferencesService;
  final bool isDarkMode;

  const MyApp({
    super.key,
    required this.hiveService,
    required this.sharedPreferencesService,
    required this.isDarkMode,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool isDarkMode;

  @override
  void initState() {
    super.initState();

    isDarkMode = widget.isDarkMode;
  }

  void changeTheme(bool value) async {
    setState(() {
      isDarkMode = value;
    });

    await widget.sharedPreferencesService.saveDarkMode(value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData.light(),

      darkTheme: ThemeData.dark(),

      themeMode:
          isDarkMode ? ThemeMode.dark : ThemeMode.light,

      home: HomePage(
        hiveService: widget.hiveService,
        isDarkMode: isDarkMode,
        onThemeChanged: changeTheme,
      ),
    );
  }
}