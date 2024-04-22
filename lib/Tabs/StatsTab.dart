import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatsTab extends StatelessWidget {
  const StatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Stats Tab",
        style: TextStyle(color: Colors.white, fontSize: 40),
      ),
    );
  }
}
