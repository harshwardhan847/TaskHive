import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_hive/Components/elevated_button.dart';
import 'package:task_hive/Components/text_button.dart';
import 'package:task_hive/Components/text_input.dart';
import 'package:task_hive/Screens/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(30),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 50),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  "Just a few quick things to get started",
                  style:
                      TextStyle(fontSize: 18, wordSpacing: 1, letterSpacing: 1),
                ),
                const SizedBox(
                  height: 20,
                ),
                const MyTextInput(
                  hintText: "Name",
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
                const SizedBox(
                  height: 20,
                ),
                const MyTextInput(
                  hintText: "Confirm Password",
                ),
                // Container(
                //   alignment: Alignment.centerRight,
                //   child: const MyTextButton(
                //     text: "Forgot password?",
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                MyElevatedButton(
                  onPressed: () {},
                  text: "Sign up",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Already have an account?"),
                    MyTextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      text: "Sign in",
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
