import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_hive/Colors/colors.dart';
import 'package:task_hive/Components/FilterButton.dart';
import 'package:task_hive/Components/elevated_button.dart';
import 'package:task_hive/Components/text_button.dart';
import 'package:task_hive/Screens/login_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String? getUserName() {
      return FirebaseAuth.instance.currentUser!.displayName;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Image.asset('assets/images/LogoHeader.png'),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              icon: Image.asset("assets/images/logout.png")),
          IconButton(
              onPressed: () {}, icon: Image.asset("assets/images/menu.png")),
        ],
      ),
      backgroundColor: MyColors.secondary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome ${getUserName()}!',
                style: const TextStyle(
                    color: MyColors.primary,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 35,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) => FilterButton(
                    text: "Completed",
                    onPressed: () {},
                    number: index + 1,
                  ),
                ),
              ),

              // Container(
              //   height: 35,
              //   width: double.infinity,
              //   child: SingleChildScrollView(
              //     physics: const ScrollPhysics(),
              //     child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       physics: const NeverScrollableScrollPhysics(),
              //       shrinkWrap: true,
              //       itemCount: 10,
              //       itemBuilder: (context, index) => FilterButton(
              //         text: "Completed",
              //         onPressed: () {},
              //       ),
              //     ),
              //   ),
              // ),
              const Text(
                "Hello",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
