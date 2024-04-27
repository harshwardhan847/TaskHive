import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_hive/Colors/colors.dart';
import 'package:task_hive/Components/FilterButton.dart';
import 'package:task_hive/Components/TodoCard.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> todos = [];
  bool loading = true;

  Future<void> getTodos(filter, filterValue) async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      final QuerySnapshot<Map<String, dynamic>> querySnapshot;
      if (filter != null) {
        querySnapshot = await FirebaseFirestore.instance
            .collection('todos')
            .where("userId", isEqualTo: userId)
            .where(filter, isEqualTo: filterValue)
            .orderBy("date", descending: false)
            .get();
      } else {
        querySnapshot = await FirebaseFirestore.instance
            .collection('todos')
            .where("userId", isEqualTo: userId)
            .orderBy("date", descending: false)
            .get();
      }

      setState(() {
        // Clear existing todos
        todos.clear();
        // Iterate through documents and add them to the todos list
        print(querySnapshot.docs.length);
        for (var doc in querySnapshot.docs) {
          todos.add({...doc.data(), "id": doc.id});
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
    getTodos(null, null);
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
            SizedBox(
                width: double.infinity,
                height: 35,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FilterButton(
                      text: "Completed",
                      onPressed: () {
                        getTodos("status", "completed");
                      },
                      number: 2,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    FilterButton(
                      text: "Completed",
                      onPressed: () {},
                      number: 2,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    FilterButton(
                      text: "Completed",
                      onPressed: () {},
                      number: 2,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    FilterButton(
                      text: "Completed",
                      onPressed: () {},
                      number: 2,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    FilterButton(
                      text: "Completed",
                      onPressed: () {},
                      number: 2,
                    ),
                  ],
                )),
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
                          return TodoCard(
                            todo: todos[index],
                            deleteTodo: () async {
                              print("Deleted from tasks tab");
                              await firestore
                                  .collection('todos')
                                  .doc(todos[index]['id'])
                                  .delete();
                              await getTodos(null, null);
                            },
                          );
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
