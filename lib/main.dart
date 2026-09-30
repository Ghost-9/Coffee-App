import 'package:flutter/material.dart';

import 'screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Artisan Coffee Roasters',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0C0F14),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFD17842),
          secondary: Color(0xFFD17842),
          surface: Color(0xFF141921),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0C0F14),
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: const Color(0xFF0C0F14),
          selectedItemColor: const Color(0xFFD17842),
          unselectedItemColor: Colors.white.withValues(alpha: 0.35),
          type: BottomNavigationBarType.fixed,
          elevation: 0,
        ),
      ),
      home: const HomePage(),
    );
  }
}
