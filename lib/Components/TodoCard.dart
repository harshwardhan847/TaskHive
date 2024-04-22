import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_hive/Colors/colors.dart';

class TodoCard extends StatelessWidget {
  Map<String, dynamic> todo = {};
  TodoCard({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    var title = todo['title'] as String;
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
                    color: Colors.redAccent.shade200,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: const Text(
                  "High",
                  style: TextStyle(color: Colors.black),
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.calendar_today,
                size: 20,
                color: MyColors.secondary,
              ),
              Text("14 oct 2024",
                  style: TextStyle(
                      color: MyColors.secondary, fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }
}
