import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:task_hive/Colors/colors.dart';
import 'package:task_hive/Components/elevated_button.dart';
import 'package:task_hive/Components/text_button.dart';
import 'package:task_hive/Components/text_input.dart';
import 'package:task_hive/Screens/home_screen.dart';
import 'package:task_hive/Screens/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String firebaseError = "";
  final _form = GlobalKey<FormState>();
  //for storing form state.
  void saveForm(context, email, password) {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    login(context, email, password);
  }

  void login(context, email, password) async {
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
    } on FirebaseAuthException catch (error) {
      setState(() {
        firebaseError = getError(error);
      });
    } finally {
      Loader.hide();
    }
  }

  String getError(err) {
    return err.message;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: MyColors.primary,
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16),
            width: double.infinity,
            child: Form(
              key: _form,
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
                    style: TextStyle(
                        fontSize: 18, wordSpacing: 1, letterSpacing: 1),
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
                      }
                      return null;
                    },
                  ),
                  firebaseError.isNotEmpty
                      ? Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            firebaseError,
                            style: TextStyle(
                              color: Colors.red.shade700,
                            ),
                          ),
                        )
                      : const SizedBox(),
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
                    secondary: true,
                    onPressed: () {
                      saveForm(context, emailController.text,
                          passwordController.text);
                    },
                    text: "Sign in",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Don't have an account?"),
                      MyTextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
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
          ),
        ),
      ),
    );
  }
}
