import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mai_jo/packages/views/welcome_page/welcome_page.dart';
import '../../../services/constant/paths_svg.dart';

class SplashScreenPage extends StatefulWidget {
  static const String routename = 'SplashScreenPage';
  const SplashScreenPage({super.key});

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(WelcomePage.routename);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0F89FF),
              Color(0xFF0073E2),
            ], // From constants
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: PathSvg.logo, // استبدل هذا بشعارك
        ),
      ),
    );
  }
}
