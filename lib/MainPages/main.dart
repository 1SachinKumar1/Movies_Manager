import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ActualPages/Form.dart';
import 'package:task_manager/MainPages/Splash.dart';
import 'package:task_manager/intro_pages/IntroPage.dart';

import '../ActualPages/List.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
        theme: ThemeData(
        // Define the default brightness and colors for the overall theme
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        // Define the default font family
        fontFamily: "GoogleFonts.arefRuqaa"),
      home: Splash(),
    );
  }
}
