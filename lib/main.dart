import 'package:flutter/material.dart';
import 'package:groceryapp/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 65, 58, 75)),
        useMaterial3: true,
        fontFamily: 'Poppins'
      ),
      home: HomePage(),
    );
  }
}