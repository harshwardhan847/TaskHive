import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:task_hive/Components/elevated_button.dart';
import 'package:task_hive/Components/text_button.dart';
import 'package:task_hive/Components/text_input.dart';
import 'package:task_hive/Screens/home_screen.dart';
import 'package:task_hive/Screens/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  void Login(context, email, password) async {
    Loader.show(
      context,
      isSafeAreaOverlay: false,
      isBottomBarOverlay: false,
      overlayFromBottom: 80,
      overlayColor: Colors.black26,
      progressIndicator:
          const CircularProgressIndicator(backgroundColor: Colors.transparent),
    );
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } finally {
      Loader.hide();
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Log In",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 50),
            ),
            const SizedBox(
              height: 60,
            ),
            const Text(
              "Hello, Welcome Back!",
              style: TextStyle(fontSize: 18, wordSpacing: 1, letterSpacing: 1),
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextInput(
              hintText: "Email",
              controller: emailController,
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextInput(
              hintText: "Password",
              controller: passwordController,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: const MyTextButton(
                text: "Forgot password?",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MyElevatedButton(
              onPressed: () {
                Login(context, emailController.text, passwordController.text);
              },
              text: "Sign in",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("Don't have an account?"),
                MyTextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  text: "Sign up",
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
