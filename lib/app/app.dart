import 'package:flutter/material.dart';
import 'presentation/home_page.dart';

class F1CounterApp extends StatelessWidget {
  
  const F1CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F1 Counter',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomePage(),
    );
  }
}
