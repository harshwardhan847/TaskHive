import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../Pages/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme(
            error: Colors.redAccent,
            onError: Colors.redAccent,
            background: Color.fromRGBO(253, 232, 162, 1),
            onBackground: Color.fromRGBO(253, 232, 162, 1),
            surface: Color.fromRGBO(54, 79, 107, 1),
            onSurface: Color.fromRGBO(54, 79, 107, 1),
            secondary: Color.fromRGBO(54, 79, 107, 1),
            onSecondary: Color.fromRGBO(54, 79, 107, 1),
            primary: Color.fromRGBO(253, 232, 162, 1),
            brightness: Brightness.light,
            onPrimary: Color.fromRGBO(253, 232, 162, 1)),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      
    );
  }
}
