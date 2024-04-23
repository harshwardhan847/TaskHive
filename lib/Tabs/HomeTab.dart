import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  List<Map<String, dynamic>> todos = [];
  bool loading = true;

  Future<void> getTodos() async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      print(userId);
      final querySnapshot = await FirebaseFirestore.instance
          // .collection('users')
          // .doc(userId)
          .collection('todos')
          .limit(5)
          .orderBy("priority")
          .orderBy("date", descending: false)
          .get();

      setState(() {
        // Clear existing todos
        todos.clear();
        // Iterate through documents and add them to the todos list
        print(querySnapshot.docs.length);
        for (var doc in querySnapshot.docs) {
          todos.add(doc.data());
        }
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        loading = false;
      });
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
            loading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: MyColors.primary,
                  ))
                : todos.isNotEmpty
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          return TodoCard(todo: todos[index]);
                        },
                      )
                    : const Center(
                        child: Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Text(
                              "No Tasks",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white),
                            )),
                      ),
          ],
        ),
      ),
    );
  }
}
