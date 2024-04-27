import 'package:flutter/material.dart';
import 'package:timer/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromRGBO(0, 39, 62, 1),
        body: SingleChildScrollView(
          
          child: Homepage(),
        )
      ),
    );
  }
}

