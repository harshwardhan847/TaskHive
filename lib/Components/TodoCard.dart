import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:task_hive/Colors/colors.dart';
import 'package:task_hive/Screens/add_todo_screen.dart';
import 'package:task_hive/Screens/login_screen.dart';

class TodoCard extends StatefulWidget {
  Map<String, dynamic> todo = {};
  Function deleteTodo;

  TodoCard({super.key, required this.todo, required this.deleteTodo});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  var priority = ["High", "Medium", "Low"];
  var statusValue = {
    "completed": "Completed",
    "inProgress": "In Progress",
    "onHold": "On Hold",
    "inReview": "In Review",
  };

  Color getColorByPriority(priorityNo) {
    switch (priorityNo) {
      case 3:
        return Colors.yellowAccent.shade200;
      case 2:
        return Colors.orangeAccent.shade200;
      case 1:
        return Colors.redAccent.shade200;
      default:
        return Colors.blueAccent.shade200;
    }
  }

  @override
  Widget build(BuildContext context) {
    var title = widget.todo['title'] as String;
    var date = widget.todo['date'] as String;
    var status = widget.todo['status'] as String;
    var priorityNo = widget.todo['priority'] as int;
    var todoId = widget.todo['id'];
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: const BoxDecoration(
          color: MyColors.primary,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title,
                  style: const TextStyle(
                      color: MyColors.secondary, fontWeight: FontWeight.w600)),
              SizedBox(
                  width: 40,
                  height: 30,
                  child: PopupMenuButton(
                    color: MyColors.secondary,
                    icon: Image.asset(
                      "assets/images/CardMenu.png",
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        onTap: () {
                          widget.deleteTodo();
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Delete",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return AddTodoScreen(
                              todo: widget.todo,
                            );
                          }));
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Edit",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5),
                padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                decoration: BoxDecoration(
                    color: getColorByPriority(priorityNo),
                    borderRadius: const BorderRadius.all(Radius.circular(30))),
                child: Text(
                  priority[priorityNo - 1],
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 15),
                padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                decoration: BoxDecoration(
                    color: getStatusColor(status),
                    borderRadius: const BorderRadius.all(Radius.circular(30))),
                child: Text(
                  statusValue[status]!,
                  style: const TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.calendar_today,
                size: 20,
                color: MyColors.secondary,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                date,
                style: const TextStyle(
                    color: MyColors.secondary, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }

  getStatusColor(status) {
    switch (status) {
      case "completed":
        return Colors.greenAccent.shade200;
      case "inProgress":
        return Colors.yellowAccent.shade100;
      case "inReview":
        return Colors.indigoAccent.shade100;
      case "onHold":
        return Colors.redAccent.shade100;
    }
  }
}
