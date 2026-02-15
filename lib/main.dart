import 'package:flutter/material.dart';
import 'package:user/login_page.dart';


void main() {
  runApp(const MFUHealthApp());
}

class MFUHealthApp extends StatelessWidget {
  const MFUHealthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MFU Health',
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: const LoginPage(),
    );
  }
}


