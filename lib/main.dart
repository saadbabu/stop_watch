import 'package:flutter/material.dart';
import 'package:stop_watch/screens/home.dart';
import 'package:stop_watch/screens/splash.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'splash',
    routes: {'splash': (context) => Mysplash(), 'home': (context) => MyHome()},
  ));
}
