import 'package:flutter/material.dart';
import 'package:task_hive/Components/elevated_button.dart';
import 'package:task_hive/Components/text_button.dart';
import 'package:task_hive/Components/text_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            const MyTextInput(
              hintText: "Email",
            ),
            const SizedBox(
              height: 20,
            ),
            const MyTextInput(
              hintText: "Password",
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
            const MyElevatedButton(
              text: "Sign in",
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("Don't have an account?"),
                const MyTextButton(
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
