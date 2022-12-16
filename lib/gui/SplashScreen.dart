import 'package:flutter/material.dart';
import 'package:list_view/util/strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(Strings.splashScreen),
      ),
    );
  }
}
