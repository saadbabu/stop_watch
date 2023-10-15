import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch/screens/home.dart';

class Mysplash extends StatefulWidget {
  const Mysplash({super.key});

  @override
  State<Mysplash> createState() => _MysplashState();
}

class _MysplashState extends State<Mysplash> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splashIconSize: 250,
        backgroundColor: const Color(0xFF1C2757),
        splash: Column(
          children: [
            Image.asset(
              "assets/stopwatch.png",
              scale: 5,
              color: Colors.white,
            ),
            const Text(
              "STOP WATCH",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            )
          ],
        ),
        nextScreen: MyHome());
  }
}
