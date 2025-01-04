import 'package:flutter/material.dart';
import 'package:hi/OnboardingScreen.dart';
import 'package:hi/intro.dart';
import 'package:hi/login.dart';
import 'package:hi/screen/SHOP/shop.dart';
import 'package:hi/screen/startpage.dart';
import 'package:hi/signup.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => shop()),
      ],
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
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const OnboardingScreen(),
      initialRoute: '/',
      routes: {
        '/home': (context) => const OnboardingScreen(),
        // '/home': (context) => const StartPage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignuPage(),
        '/intro': (context) => const IntroPage(),
        '/homePage': (context) => const Homepage(),
      },
    );
  }
}
 