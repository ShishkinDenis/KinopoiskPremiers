import 'package:flutter/material.dart';
import 'package:list_view/gui/login/login.dart';
import '../gui/films/films.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}
