import 'package:flutter/material.dart';

class ChildPage extends StatelessWidget {
  const ChildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Chilld Page",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
