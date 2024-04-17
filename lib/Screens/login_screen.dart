import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_hive/Components/elevated_button.dart';
import 'package:task_hive/Components/text_button.dart';
import 'package:task_hive/Components/text_input.dart';
import 'package:task_hive/Screens/home_screen.dart';
import 'package:task_hive/Screens/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  void Login(context, email, password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController EmailController = new TextEditingController();
    TextEditingController PasswordController = new TextEditingController();
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
              controller: EmailController,
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextInput(
              hintText: "Password",
              controller: PasswordController,
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
                Login(context, EmailController.text, PasswordController.text);
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
                            builder: (context) => const SignUpScreen()));
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
