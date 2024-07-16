import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_edu_tea/extension/context_extension.dart';

import '../../style/style_scheme.dart';

class LeadingTitle extends StatelessWidget {
  final String title;
  final Color? barColor;
  final Color? titleColor;
  final String? fontFamily;
  final double? fontSize;

  const LeadingTitle({
    super.key,
    required this.title,
    this.barColor,
    this.titleColor,
    this.fontFamily,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final mtheme = context.theme;
    return IntrinsicHeight(
      child: Row(
        children: [
          VerticalDivider(
            color: barColor ?? mtheme.colorScheme.primary,
            thickness: 4,
            width: 4,
          ),
          SizedBox(width: 5.w),
          Text(
            title,
            style: context.textTheme.titleLarge?.copyWith(
              color: titleColor ?? mtheme.colorScheme.onSurface,
              fontWeight: FontWeight.w500,
              fontFamily: fontFamily ?? StyleScheme.engFontFamily,
              letterSpacing: -0.5,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}