import 'package:flutter/material.dart';
import 'package:smart_edu_tea/extension/context_extension.dart';

class TextIconChip extends StatelessWidget {
  const TextIconChip({
    super.key,
    required this.icon,
    required this.text,
    this.iconSize = 20,
    this.textSize = 16,
    this.iconColor,
    this.textColor,
    this.backgroundColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  });

  final IconData icon;
  final String text;
  final double iconSize;
  final double textSize;
  final Color? iconColor;
  final Color? textColor;
  final Color? backgroundColor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? context.theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: iconSize,
            color: iconColor ?? context.theme.colorScheme.onPrimary,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              fontSize: textSize,
              color: textColor ?? context.theme.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}