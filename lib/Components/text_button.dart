import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_hive/Colors/colors.dart';

class MyTextButton extends StatelessWidget {
  final String text;
  const MyTextButton({super.key, this.text = ""});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          // backgroundColor: MaterialStatePropertyAll(Colors.redAccent),
          // padding: MaterialStateProperty.all(const EdgeInsets.all(4)),
          foregroundColor: MaterialStateProperty.all(MyColors.secondary)),
      onPressed: () {
        print('MyTextButton was pressed');
      },
      child: Text(text),
    );
  }
}
