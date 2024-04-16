import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_hive/Colors/colors.dart';

class MyTextInput extends StatelessWidget {
  final String hintText;
  final String value;
  final TextEditingController? controller;
  const MyTextInput({
    super.key,
    required this.hintText,
    this.value = '',
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: MyColors.primary),
      decoration: InputDecoration(
        fillColor: MyColors.secondary,
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(
            color: MyColors.primaryDull, fontWeight: FontWeight.w400),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
