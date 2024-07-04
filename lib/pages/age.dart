import 'package:flutter/material.dart';

class Age extends StatelessWidget {
  final int age;
  const Age({
    super.key,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Age is : $age"),
      ),
    );
  }
}
