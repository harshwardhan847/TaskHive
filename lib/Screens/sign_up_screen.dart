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
  final _form = GlobalKey<FormState>();
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
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
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
      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      // await db.collection("users").doc(userId).set(user);
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
      backgroundColor: MyColors.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _form,
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
                    style: TextStyle(
                        fontSize: 18, wordSpacing: 1, letterSpacing: 1),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextInput(
                    hintText: "Name",
                    controller: nameController,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please enter your name.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextInput(
                    hintText: "Email",
                    controller: emailController,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please enter your email.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextInput(
                    hintText: "Password",
                    controller: passwordController,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please enter your password.";
                      } else if (val.length < 6) {
                        return "Password must be at least 6 characters.";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextInput(
                    hintText: "Confirm Password",
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please confirm your password.";
                      } else if (val != passwordController.text) {
                        return "Passwords don't match.";
                      }
                      return null;
                    },
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
                          Navigator.pushReplacement(
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
      ),
    );
  }
}
