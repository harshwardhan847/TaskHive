import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:task_hive/Colors/colors.dart';

class FilterButton extends StatefulWidget {
  const FilterButton(
      {super.key,
      this.text = "",
      this.onPressed,
      required this.currentFilter,
      required this.filterIndex});
  final String text;
  final int currentFilter;
  final int filterIndex;
  final void Function()? onPressed;

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  bool loading = true;
  int? number;
  @override
  void initState() {
    super.initState();
  }

  Future<int?> getTodosCount(filter, filterValue) async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;

      final querySnapshot = await FirebaseFirestore.instance
          .collection('todos')
          .where("userId", isEqualTo: userId)
          .where(filter, isEqualTo: filterValue)
          .orderBy("date", descending: false)
          .count()
          .get();
      setState(() {
        loading = false;
      });

      return querySnapshot.count;
    } catch (e) {
      print(e);
      return 0; // Return 0 in case of an error
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  Future<int?> getFilterTodoCount(int filterCount) async {
    switch (filterCount) {
      case 1:
        if (filterCount == widget.currentFilter) {
          return await getTodosCount("status", "completed");
        }
        break;
      case 2:
        if (filterCount == widget.currentFilter) {
          return await getTodosCount("status", "inReview");
        }
        break;
      case 3:
        if (filterCount == widget.currentFilter) {
          return await getTodosCount("status", "onHold");
        }
        break;
      case 4:
        if (filterCount == widget.currentFilter) {
          return await getTodosCount("status", "inProgress");
        }
        break;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  widget.filterIndex == widget.currentFilter
                      ? Colors.indigoAccent
                      : Colors.blueAccent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      side: BorderSide(color: Colors.white, width: 2))),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.fromLTRB(8, 8, 8, 8))),
          onPressed: () async {
            widget.onPressed!();
            // print("current filter${widget.filterIndex}");
            // var count = await getFilterTodoCount(widget.filterIndex);
            // print("count$count");
            // setState(() {
            //   number = count;
            // });
          },
          child: Row(
            children: [
              Text(
                widget.text,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              widget.filterIndex == widget.currentFilter && number != null
                  ? Container(
                      padding: const EdgeInsets.all(1),
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
                  : const SizedBox(),
            ],
          )),
    );
  }
}
