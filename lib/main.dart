import 'package:flutter/material.dart';
import 'package:smart_qhwa/screens/home_screen.dart';

void main() {
  runApp(const QhwaApp());
}

class QhwaApp extends StatelessWidget {
  const QhwaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
