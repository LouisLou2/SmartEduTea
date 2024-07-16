import 'package:flutter/material.dart';

class IconChequer extends StatelessWidget {
  const IconChequer({super.key, required this.icon, this.color});

  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color?.withOpacity(0.3),
      ),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }
}