import 'package:flutter/material.dart';

class Ball extends StatelessWidget {
  final Color color;
  const Ball({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,

        boxShadow: [BoxShadow(color: color.withOpacity(0.5), blurRadius: 5)],
      ),
    );
  }
}
