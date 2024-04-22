import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:task_hive/Colors/colors.dart';
import 'package:task_hive/Components/FilterButton.dart';
import 'package:task_hive/Components/TodoCard.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<Map<String, dynamic>> todos = []; // Change to a list of maps

  Future<void> getTodos() async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      print(userId);
      final querySnapshot = await FirebaseFirestore.instance
          // .collection('users')
          // .doc(userId)
          .collection('todos')
          .get();

      setState(() {
        // Clear existing todos
        todos.clear();
        // Iterate through documents and add them to the todos list
        querySnapshot.docs.forEach((doc) {
          print(doc.data());
          todos.add(doc.data() as Map<String, dynamic>);
        });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getTodos();
  }

  @override
  Widget build(BuildContext context) {
    String? getUserName() {
      return FirebaseAuth.instance.currentUser?.displayName;
    }

    return SingleChildScrollView(
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
            // Uncomment the following code to display todos
            ListView.builder(
              shrinkWrap: true,
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return TodoCard(todo: todos[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
