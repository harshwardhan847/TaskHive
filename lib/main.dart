import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
            secondary: Color.fromRGBO(27, 37, 50, 1),
            onSecondary: Color.fromRGBO(27, 37, 50, 1),
            primary: Color.fromRGBO(253, 232, 162, 1),
            brightness: Brightness.light,
            onPrimary: Color.fromRGBO(253, 232, 162, 1)),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
