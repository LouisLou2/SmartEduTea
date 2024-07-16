import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_edu_tea/extension/context_extension.dart';

import '../../../entity/general/role_enum.dart';
import '../../../style/style_scheme.dart';


class SidebarHeaderAC extends StatelessWidget {
  final Role role;
  const SidebarHeaderAC({
    super.key,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    final mtheme = context.theme;
    String tip = getRoleText(role);
    return ListTile(
      minTileHeight: 0,
      titleAlignment: ListTileTitleAlignment.center,
      horizontalTitleGap: 8.w,
      contentPadding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h, bottom: 10.h),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      leading: Image.asset(
        'assets/image/flutter_icon.png',
        fit: BoxFit.cover,
        width: 19.sp,
      ),
      title: Text(
        'CSU Academy',
        style: mtheme.textTheme.titleLarge?.copyWith(
          letterSpacing: -0.5,
          fontWeight: FontWeight.w500,
          fontFamily: StyleScheme.engFontFamily,
          fontSize: 20.sp,
        ),
      ),
      onTap: (){},
      trailing: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
        decoration: BoxDecoration(
          color: mtheme.colorScheme.primary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          tip,
          style: context.textTheme.titleMedium?.copyWith(
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
            fontFamily: StyleScheme.engFontFamily,
            color: mtheme.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}