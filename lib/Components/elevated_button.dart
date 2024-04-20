import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_hive/Colors/colors.dart';

class MyElevatedButton extends StatelessWidget {
  MyElevatedButton({super.key, this.text = "", this.onPressed});
  final String text;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(MyColors.secondary),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              )),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.fromLTRB(20, 10, 20, 10))),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          )),
    );
  }
}
