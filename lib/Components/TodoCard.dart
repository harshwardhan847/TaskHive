import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_hive/Colors/colors.dart';

class TodoCard extends StatelessWidget {
  Map<String, dynamic> todo = {};
  var priority = ["High", "Medium", "Low"];
  TodoCard({super.key, required this.todo});
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
    var title = todo['title'] as String;
    var date = todo['date'] as String;
    var priorityNo = todo['priority'] as int;
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
                  style: TextStyle(
                      color: MyColors.secondary, fontWeight: FontWeight.w600)),
              SizedBox(
                width: 40,
                height: 30,
                child: IconButton(
                  alignment: Alignment.center,
                  style: const ButtonStyle(
                      // backgroundColor: MaterialStatePropertyAll(Colors.red),
                      padding: MaterialStatePropertyAll(EdgeInsets.all(0))),
                  onPressed: () {},
                  icon: Image.asset("assets/images/CardMenu.png"),
                ),
              )
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
                    color: Colors.greenAccent.shade200,
                    borderRadius: const BorderRadius.all(Radius.circular(30))),
                child: const Text(
                  "On Track",
                  style: TextStyle(color: Colors.black),
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
              Text(date,
                  style: const TextStyle(
                      color: MyColors.secondary, fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }
}
