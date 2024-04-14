import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_hive/Colors/colors.dart';

class MyTextInput extends StatefulWidget {
  final String hintText;
  const MyTextInput({
    super.key,
    required this.hintText,
  });

  @override
  State<MyTextInput> createState() => _MyTextInputState();
}

class _MyTextInputState extends State<MyTextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: MyColors.primary),
      decoration: InputDecoration(
        fillColor: MyColors.secondary,
        filled: true,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
            color: MyColors.primaryDull, fontWeight: FontWeight.w400),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
