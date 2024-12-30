import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/intro.jpg'), // Path to your image
            fit: BoxFit.cover, // Adjusts how the image fits the container
          ),
        ),
        child: Stack(
          children: [
            // Text and Button
            Align(
              alignment: Alignment.bottomCenter, // Align to bottom center
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 50.0), // Adjust bottom padding
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Keeps content compact
                  children: [
                    const Text(
                      "You want\nAuthentic, here you go!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        height: 1.5, // Line height
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Find it here, buy it now!",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/homePage');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent, // Button color
                        foregroundColor: Colors.white, // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                      ),
                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
