import 'package:flutter/material.dart';

void main() {
  runApp(const MyProjects());
}

class MyProjects extends StatelessWidget {
  const MyProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false);
  }
}
