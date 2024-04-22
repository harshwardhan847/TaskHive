import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:task_hive/Colors/colors.dart';
import 'package:task_hive/Components/elevated_button.dart';
import 'package:task_hive/Components/text_button.dart';
import 'package:task_hive/Components/text_input.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController dateController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController timeTakenController = TextEditingController();
  final _form = GlobalKey<FormState>();
  List<String> dropDownItems = ["High", "Medium", "Low"];
  String selectedValue = "Medium";
  final now = DateTime.now();
  void addTodo() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final todo = <String, dynamic>{
      "title": titleController.text,
      "description": descriptionController.text,
      "date": dateController.text,
      "timeTaken": timeTakenController.text,
      "priority": selectedValue,
      "isCompleted": false,
      "userId": userId,
      // "score": 0, TODO add score to the todo
    };

    await db.collection("todos").add(todo);
    Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    dateController.text =
        DateTime(now.year, now.month, now.day + 1).toString().split(" ")[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> selectDate() async {
      DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100));
      if (pickedDate != null) {
        setState(() {
          dateController.text = pickedDate.toString().split(" ")[0];
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        title: const Text(
          "Add Todo",
          style: TextStyle(color: MyColors.secondary),
        ),
      ),
      backgroundColor: MyColors.primary,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          width: double.infinity,
          child: Form(
            key: _form,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                MyTextInput(
                  hintText: "Title",
                  controller: titleController,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Enter title";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextInput(
                  hintText: "Description",
                  maxLines: 10,
                  controller: descriptionController,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Enter description";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextInput(
                  hintText: "Time taken (hrs)",
                  keyboardType: TextInputType.number,
                  controller: timeTakenController,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Enter Time to complete task.";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child: MyTextInput(
                        hintText: "Due Date",
                        readOnly: true,
                        prefixIcon: const Icon(
                          Icons.calendar_today,
                          color: MyColors.primary,
                          size: 25,
                        ),
                        onTap: () {
                          selectDate();
                        },
                        value: dateController.text,
                        controller: dateController,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 60,
                      padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: MyColors.secondary),
                      width: 120,
                      child: DropdownButtonFormField(
                        alignment: Alignment.center,
                        dropdownColor: MyColors.secondary,
                        hint: const Text("Priority"),
                        style: const TextStyle(color: MyColors.primary),
                        items: dropDownItems.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              textAlign: TextAlign.center,
                            ),
                          );
                        }).toList(),
                        value: selectedValue,
                        onChanged: (String? value) {
                          if (value != null) {
                            setState(() {
                              selectedValue = value;
                            });
                          }
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                MyElevatedButton(
                  text: "Add Todo",
                  onPressed: addTodo,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
