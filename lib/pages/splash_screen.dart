import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        Navigator.of(context).pushNamed("/");
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: const Color(0xff4267b2),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Center(
          child: Image.asset(
            "assets/images/splash.png",
            height: MediaQuery.of(context).size.height * 0.4,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
