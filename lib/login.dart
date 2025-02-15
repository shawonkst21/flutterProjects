import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FadeInUp(
                duration: const Duration(milliseconds: 1000),
                child: const Text(
                  'Welcome Back!',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              FadeInUp(
                duration: const Duration(milliseconds: 1200),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Username or Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.person),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              FadeInUp(
                duration: const Duration(milliseconds: 1400),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FadeInUp(
                  duration: const Duration(milliseconds: 1600),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FadeInUp(
                duration: const Duration(milliseconds: 1800),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/intro');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.blueGrey.shade900,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text('Login'),
                ),
              ),
              const SizedBox(height: 20),
              FadeInUp(
                duration: const Duration(milliseconds: 2000),
                child: const Center(child: Text('- OR Continue with -')),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInUp(
                    duration: const Duration(milliseconds: 2200),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.g_mobiledata),
                      color: Colors.red,
                      iconSize: 30,
                    ),
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 2400),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.apple),
                      iconSize: 30,
                    ),
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 2600),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.facebook),
                      color: Colors.blue,
                      iconSize: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              FadeInUp(
                duration: const Duration(milliseconds: 2800),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Create an Account',
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(width: 5),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
