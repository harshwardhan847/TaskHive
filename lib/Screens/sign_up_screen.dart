import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:task_hive/Colors/colors.dart';
import 'package:task_hive/Components/elevated_button.dart';
import 'package:task_hive/Components/text_button.dart';
import 'package:task_hive/Components/text_input.dart';
import 'package:task_hive/Screens/login_screen.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    Loader.hide();
    super.dispose();
  }

  void signUp(String name, String email, String password) async {
    String errorMessage;
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
      final newUserCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final userId = newUserCredential.user!.uid;
      final user = <String, dynamic>{
        "name": name,
      };
      await db.collection("users").doc(userId).set(user);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } on FirebaseAuthException catch (error) {
      print(error);
    } finally {
      Loader.hide();
    }
  }

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
                MyTextInput(
                  hintText: "Name",
                  controller: nameController,
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
                  onPressed: () {
                    signUp(nameController.text, emailController.text,
                        passwordController.text);
                  },
                  text: "Sign up",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("Already have an account?"),
                    MyTextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
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
