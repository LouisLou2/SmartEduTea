import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu_tea/extension/context_extension.dart';

import '../../entity/general/option_section.dart';
import '../../entity/general/tuple2.dart';
import '../../style/style_scheme.dart';

List<Widget> getTextList(List<OptionSection> list, BuildContext context,) {
  List<Widget> widgets= [];
  var theme = context.theme;
  for(int i=0;i<list.length;++i){
    var sec=list[i];
    widgets.add(
      Padding(
        padding: const EdgeInsets.fromLTRB(32, 6, 6, 6),
        child: Text(
          sec.title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
            fontFamily: StyleScheme.engFontFamily,
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
    for(int j=0;j<sec.options.length;++j){
      widgets.add(
        ShadOption<Tuple2<int,int>>(
          value: Tuple2<int,int>(i,j),
          child: Text(
            sec.options[j],
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              fontFamily: StyleScheme.engFontFamily,
            ),
          ),
        ),
      );
    }
  }
  return widgets;
}