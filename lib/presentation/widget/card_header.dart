import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_edu_tea/extension/context_extension.dart';

import '../../style/style_scheme.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({
    super.key,
    required this.title,
    this.subtitle,
    required this.trailingMore,
    required this.onTap,
    this.titleFontSize = 16.0,
    this.titleFontFamily = StyleScheme.cnFontFamily,
    this.buttonFontFamily = StyleScheme.engFontFamily,
    this.titleFontWeight = FontWeight.w700,
  });

  final String title;
  final String? subtitle;
  final String trailingMore;
  final VoidCallback onTap;
  final String titleFontFamily;
  final String buttonFontFamily;
  final double titleFontSize;
  final FontWeight titleFontWeight;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
        title: Text(
          title,
          style: context.theme.textTheme.bodyMedium?.copyWith(
            fontWeight: titleFontWeight,
            fontFamily: titleFontFamily,
            fontSize: titleFontSize,
          ),
        ),
        trailing: TextButton(
          onPressed: onTap,
          child: Wrap(
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                trailingMore,
                style: TextStyle(
                  fontSize: titleFontSize * 0.9,
                  color: context.theme.colorScheme.primary,
                  fontFamily: buttonFontFamily,
                  letterSpacing: -0.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: context.theme.colorScheme.primary,
                size: titleFontSize * 0.9,
              ),
            ],
          ),
        )
      ),
    );
  }
}