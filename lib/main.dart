import 'package:flutter/material.dart';
import 'package:suitmedia_app/first_page.dart';
import 'package:suitmedia_app/second_page.dart';
import 'package:suitmedia_app/third_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const FirstPage(),
        '/second-page': (context) => const SecondPage(name: ''),
        '/third-page': (context) => const ThirdPage(),
      },
    );
  }
}
