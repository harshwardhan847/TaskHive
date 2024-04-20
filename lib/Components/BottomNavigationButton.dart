import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_hive/Colors/colors.dart';

class BottomNavigationButton extends StatelessWidget {
  bool active;
  IconData icon;
  String text;
  BottomNavigationButton(
      {super.key,
      required this.active,
      required this.icon,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(MyColors.primary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          )),
          padding: MaterialStateProperty.all(
              const EdgeInsets.fromLTRB(20, 10, 20, 10))),
      onPressed: () {},
      child: Row(
        children: [
          Icon(
            icon,
            color: MyColors.secondary,
          ),
          active
              ? const SizedBox(
                  width: 4,
                )
              : const SizedBox(),
          active
              ? Text(
                  text,
                  style: const TextStyle(color: MyColors.secondary),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
