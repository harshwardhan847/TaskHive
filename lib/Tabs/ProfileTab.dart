import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Profile Tab",
        style: TextStyle(color: Colors.white, fontSize: 40),
      ),
    );
  }
}
