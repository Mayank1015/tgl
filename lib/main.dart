import 'package:flutter/material.dart';
import 'package:tgl_ai/pages/login/login_page.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    // seedColor: const Color(0xffDD2440),
    seedColor: Colors.white,
  ),
);


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: const LogInScreen(),
    );
  }
}
