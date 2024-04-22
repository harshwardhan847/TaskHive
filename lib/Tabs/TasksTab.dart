import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Tasks Tab",
        style: TextStyle(color: Colors.white, fontSize: 40),),
    );
  }
}
