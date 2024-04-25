import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_hive/Colors/colors.dart';
import 'package:task_hive/Components/StatCard.dart';

class BasicStats extends StatefulWidget {
  const BasicStats({super.key});

  @override
  State<BasicStats> createState() => _BasicStatsState();
}

class _BasicStatsState extends State<BasicStats> {
  String completed = "...";
  String inProgress = "...";
  String onHold = "...";
  String inReview = "...";

  @override
  void initState() {
    super.initState();
    setCompletedTasks();
  }

  Future<void> setCompletedTasks() async {
    final completedSnapshot = await FirebaseFirestore.instance
        .collection("todos")
        .where("completed", isEqualTo: true)
        .get();
    final inProgressSnapshot = await FirebaseFirestore.instance
        .collection("todos")
        .where("completed", isEqualTo: true)
        .get();
    final onHoldSnapshot = await FirebaseFirestore.instance
        .collection("todos")
        .where("completed", isEqualTo: true)
        .get();
    final inReviewSnapshot = await FirebaseFirestore.instance
        .collection("todos")
        .where("completed", isEqualTo: true)
        .get();
    setState(() {
      completed = completedSnapshot.docs.length.toString();
      inReview = inReviewSnapshot.docs.length.toString();
      onHold = onHoldSnapshot.docs.length.toString();
      inProgress = inProgressSnapshot.docs.length.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Stats",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StatCard(
                    value: inProgress,
                    title: "In Progress",
                    color: Colors.yellowAccent.shade100,
                  ),
                  StatCard(
                    value: inReview,
                    title: "In Review",
                    color: Colors.indigoAccent.shade100,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StatCard(
                    value: onHold,
                    title: "On Hold",
                    color: Colors.redAccent.shade100,
                  ),
                  StatCard(
                    value: completed,
                    title: "Completed",
                    color: Colors.greenAccent.shade200,
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
