import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_edu_tea/extension/context_extension.dart';
import 'package:smart_edu_tea/style/style_scheme.dart';
import 'package:smart_edu_tea/util/format_util.dart';

class NumStatCard extends StatelessWidget {
  final String title;
  final String detailStr;
  final int number;
  final Color color;
  final VoidCallback onTap;
  final double numFontSize;
  final EdgeInsetsGeometry contentPadding;

  const NumStatCard({
    super.key,
    required this.title,
    required this.detailStr,
    required this.number,
    required this.color,
    required this.onTap,
    this.contentPadding = const EdgeInsets.all(8.0),
    required this.numFontSize,
  });

  @override
  Widget build(BuildContext context) {
    final mtheme = context.theme;
    return Container(
      padding: contentPadding,
      decoration: BoxDecoration(
        color: mtheme.colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: context.theme.colorScheme.outlineVariant,
          width: 0.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: mtheme.textTheme.titleMedium?.copyWith(
                  color: mtheme.colorScheme.onSurface,
                  fontSize: numFontSize * 0.6,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: numFontSize,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: const CircleBorder(),
                    side: BorderSide(
                      color: mtheme.colorScheme.secondary,
                      width: 1,
                    ),
                  ),
                  onPressed: onTap,
                  child: Icon(
                    CupertinoIcons.arrow_up_right,
                    color: mtheme.colorScheme.secondary,
                    size: numFontSize * 0.7,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: contentPadding.vertical*0.2,),
          Wrap(
            spacing: 2,
            direction: Axis.vertical,
            children: [
              Text(
                FormatUtil.numComma(number),
                style: mtheme.textTheme.titleMedium?.copyWith(
                  fontFamily: StyleScheme.engFontFamily,
                  fontSize: numFontSize,
                ),
              ),
              Text(
                detailStr,
                style: mtheme.textTheme.titleMedium?.copyWith(
                  fontSize: numFontSize * 0.45,
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}