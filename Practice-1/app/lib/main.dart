import 'package:app/OnBoarding/UserAge.dart';
import 'package:app/OnBoarding/completeProfile.dart';
import 'package:app/OnBoarding/onboard.dart';
import 'package:app/homepage/homepage.dart';
import 'package:app/redirect_page.dart';
import 'package:app/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
