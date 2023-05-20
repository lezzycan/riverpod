import 'package:flutter/material.dart';

class Rebuton extends StatelessWidget {
  const Rebuton({super.key, required this.onTap, required this.text, required this.color});
  final VoidCallback onTap;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 150,
        width: double.infinity,
        color: color,
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
