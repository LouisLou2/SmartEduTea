import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu_tea/extension/context_extension.dart';

import '../../style/style_scheme.dart';

Widget getPercentCard(BuildContext context, double all, double now, String name){
  return ShadCard(
    padding: EdgeInsets.only(top: 15.h, left: 20.w, right: 20.w, bottom: 15.h),
    content: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              direction: Axis.vertical,
              children: [
                Text(
                  name,
                  style: context.theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                Wrap(
                  direction: Axis.horizontal,
                  children: [
                    Text(
                      '$now/',
                      style: context.theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontFamily: StyleScheme.engFontFamily,
                        color: context.theme.colorScheme.primary,
                        fontSize: 18.sp,
                      ),
                    ),
                    Text(
                      '$all',
                      style: context.theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontFamily: StyleScheme.engFontFamily,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Text(
              '已完成',
              style: context.theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
                fontFamily: StyleScheme.engFontFamily,
                fontSize: 15.w,
                color: context.theme.colorScheme.primary.withOpacity(0.7),
              ),
            ),
          ],
        ),
        SizedBox(width: 20.w,),
      ],
    ),
  );
}