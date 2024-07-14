import 'package:chatbox/firebase_options.dart';
import 'package:chatbox/on_boarding/screen_!.dart';
import 'package:chatbox/utils/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: kDebugMode,
      title: 'ChatBox',
      themeMode: ThemeMode.dark,
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      home: const OnBoarding(),
    );
  }
}


