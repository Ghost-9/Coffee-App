import 'package:flutter/material.dart';

import 'screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        canvasColor: Colors.black,
        brightness: Brightness.dark,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedIconTheme: const IconThemeData(color: Colors.orange),
          unselectedIconTheme:
              IconThemeData(color: Colors.white.withOpacity(0.5)),
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white.withOpacity(0.5),
        ),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
