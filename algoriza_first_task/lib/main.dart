// Flutter imports:
import 'package:algoriza_first_task/modules/onBoarding_screen.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:algoriza_first_task/modules/signin_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
    );
  }
}
