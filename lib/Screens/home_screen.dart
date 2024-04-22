import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
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
import 'package:task_hive/Tabs/HomeTab.dart';
import 'package:task_hive/Tabs/ProfileTab.dart';
import 'package:task_hive/Tabs/StatsTab.dart';
import 'package:task_hive/Tabs/TasksTab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final Tween<double> turnsTween = Tween<double>(
    begin: 1,
    end: 0,
  );

  int tab = 0;
  @override
  void initState() {
    super.initState();
    tab = 0;
  }

  List<Widget> tabs = [
    const HomeTab(),
    const TasksTab(),
    const StatsTab(),
    const ProfileTab(),
  ];
  @override
  Widget build(BuildContext context) {
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
                active: tab == 0,
                onPressed: () {
                  setState(() {
                    tab = 0;
                  });
                }),
            BottomNavigationButton(
                icon: Icons.task_alt_outlined,
                text: "Tasks",
                active: tab == 1,
                onPressed: () {
                  setState(() {
                    tab = 1;
                  });
                }),
            BottomNavigationButton(
                icon: Icons.bar_chart_outlined,
                text: "Stats",
                active: tab == 2,
                onPressed: () {
                  setState(() {
                    tab = 2;
                  });
                }),
            BottomNavigationButton(
                icon: Icons.supervised_user_circle_outlined,
                text: "Profile",
                active: tab == 3,
                onPressed: () {
                  setState(() {
                    tab = 3;
                  });
                })
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
      body: AnimatedSwitcher(
        transitionBuilder: (child, animation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        duration: const Duration(milliseconds: 100),
        child: tabs[tab],
      ),
    );
  }
}
