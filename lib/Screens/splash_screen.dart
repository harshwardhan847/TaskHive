import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:task_hive/Colors/colors.dart';
import 'package:task_hive/Screens/home_screen.dart';
import 'package:task_hive/Screens/login_screen.dart';
import 'package:task_hive/Screens/sign_up_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  void getScreenByAuth() async {
    bool logged = false;
    await auth.authStateChanges().map((User? user) {
      if (user == null) {
        logged = false;
      } else {
        logged = true;
      }
    }).first;
    Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    logged ? const HomePage() : const LoginScreen(),
              ),
            ));
  }

  //runs first while loading screen
  @override
  void initState() {
    super.initState();
    //to remove top and bottom bars while splash screen is shown
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    getScreenByAuth();
  }

  //cleanup function
  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   title: const Text('Flutter Demo Home Page'),
      // ),
      body: Center(
        child: Image.asset('assets/images/Logo.png'),
      ),
    );
  }
}
