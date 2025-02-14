import 'package:Trendify/screen/SHOP/shop.dart';
import 'package:flutter/material.dart';
import 'package:Trendify/OnboardingScreen.dart';
import 'package:Trendify/intro.dart';
import 'package:Trendify/login.dart';
import 'package:Trendify/screen/SHOP/Coupon.dart';
import 'package:Trendify/screen/filter.dart';
import 'package:Trendify/screen/startpage.dart';
import 'package:Trendify/signup.dart';
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
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.deepPurple),
      home: const OnboardingScreen(),
      initialRoute: '/',
      routes: {
        '/home': (context) => const OnboardingScreen(),
        // '/home': (context) => const StartPage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignuPage(),
        '/intro': (context) => const IntroPage(),
        '/homePage': (context) => const Homepage(),
        '/coupon': (context) => CouponPage(),
        '/filter': (context) => const FilterPage(),
      },
    );
  }
}
