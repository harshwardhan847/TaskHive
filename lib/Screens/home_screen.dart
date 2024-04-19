import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_hive/Colors/colors.dart';
import 'package:task_hive/Components/elevated_button.dart';
import 'package:task_hive/Screens/login_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String? getUserEmail() {
      return FirebaseAuth.instance.currentUser!.email;
    }

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   title: const Text('Flutter Demo Home Page'),
      // ),
      // backgroundColor: MyColors.secondary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome ${getUserEmail()}'),
            MyElevatedButton(
                text: "Log Out",
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                })
          ],
        ),
      ),
    );
  }
}
