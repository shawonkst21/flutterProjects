import 'package:flutter/material.dart';
import 'package:hi/OnboardingScreen.dart';
import 'package:hi/loginSreen.dart';

import 'details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Container(color: Colors.white, child: const OnboardingScreen()),
      initialRoute: '/',
      routes: {
        '/home': (context) => const details(),
        '/login': (context) => const loginScreen()
      },
    );
  }
}
