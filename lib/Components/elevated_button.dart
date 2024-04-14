import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              )),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.fromLTRB(20, 10, 20, 10))),
          onPressed: () {},
          child: const Text(
            "Sign in",
            style: TextStyle(fontSize: 20, color: Colors.white),
          )),
    );
  }
}
