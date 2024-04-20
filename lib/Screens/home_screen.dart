import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_hive/Colors/colors.dart';
import 'package:task_hive/Components/BottomNavigationButton.dart';
import 'package:task_hive/Components/FilterButton.dart';
import 'package:task_hive/Components/TodoCard.dart';
import 'package:task_hive/Components/elevated_button.dart';
import 'package:task_hive/Components/text_button.dart';
import 'package:task_hive/Screens/login_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String? getUserName() {
      return FirebaseAuth.instance.currentUser?.displayName;
    }

    return Scaffold(
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(10),
              backgroundColor:
                  MaterialStateProperty.all(Colors.redAccent.shade200),
              foregroundColor:
                  MaterialStateProperty.all<Color>(MyColors.secondary)),
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(8),
        color: MyColors.secondary,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BottomNavigationButton(
              icon: Icons.home_outlined,
              text: "Home",
              active: true,
            ),
            BottomNavigationButton(
              icon: Icons.task_alt_outlined,
              text: "Tasks",
              active: false,
            ),
            BottomNavigationButton(
              icon: Icons.bar_chart_outlined,
              text: "Stats",
              active: false,
            ),
            BottomNavigationButton(
              icon: Icons.supervised_user_circle_outlined,
              text: "Profile",
              active: false,
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Image.asset(
          'assets/images/LogoHeader.png',
          scale: 1.5,
        ),
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
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome ${getUserName() ?? ''}!',
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
              const SizedBox(
                height: 20,
              ),
              ...List.generate(20, (index) => const TodoCard()),
            ],
          ),
        ),
      ),
    );
  }
}
