import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:task_hive/Colors/colors.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key, this.text = "", this.onPressed, this.number});
  final String text;
  final int? number;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      side: BorderSide(color: Colors.white, width: 2))),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.fromLTRB(8, 8, 8, 8))),
          onPressed: onPressed,
          child: Row(
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                padding: EdgeInsets.all(1),
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Colors.greenAccent),
                child: Center(
                  child: Text(
                    number.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: MyColors.secondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
