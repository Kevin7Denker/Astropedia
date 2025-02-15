import 'dart:io';

import 'package:astropedia/Pages/home_page.dart';
import 'package:astropedia/Pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.purple,
        brightness: Brightness.dark,
      ),
      routes: {
        '/': (context) => const WelcomePage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
