import 'package:flutter/material.dart';

class Legend extends StatefulWidget {
  const Legend({super.key, required this.color, required this.desc, required this.radius,});
  final Color color;
  final String desc;
  final double radius;
  @override
  State<Legend> createState() => _LegendState();
}

class _LegendState extends State<Legend> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: widget.radius,
          backgroundColor: widget.color,
        ),
        const SizedBox(width: 5),
        Text(
          widget.desc,
          style: const TextStyle(
            letterSpacing: -0.6,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}