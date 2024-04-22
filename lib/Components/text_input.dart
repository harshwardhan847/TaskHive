import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_hive/Colors/colors.dart';

class MyTextInput extends StatelessWidget {
  final String hintText;
  final String value;
  final TextEditingController? controller;
  final int? maxLines;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final Widget? prefixIcon;
  final bool readOnly;
  const MyTextInput(
      {super.key,
      required this.hintText,
      this.value = '',
      this.controller,
      this.maxLines,
      this.onTap,
      this.prefixIcon,
      this.readOnly = false,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      cursorColor: MyColors.primary,
      readOnly: readOnly,
      onTap: onTap,
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: MyColors.primary),
      decoration: InputDecoration(
        fillColor: MyColors.secondary,
        filled: true,
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.primary),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        prefixIcon: prefixIcon,
        hintText: hintText,
        errorStyle: TextStyle(color: Colors.red.shade700, fontSize: 12),
        hintStyle: const TextStyle(
            color: MyColors.primaryDull, fontWeight: FontWeight.w400),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
