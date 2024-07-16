import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu_tea/entity/general/option_section.dart';
import 'package:smart_edu_tea/extension/context_extension.dart';
import 'package:smart_edu_tea/presentation/widget/text_list.dart';
import 'package:time_planner/time_planner.dart';

import '../../entity/general/tuple2.dart';
import '../../entity/term.dart';
import '../../style/style_scheme.dart';

class TeacherSched extends StatefulWidget{
  const TeacherSched({super.key});

  @override
  State<TeacherSched> createState() => _TeacherSchedState();
}

class _TeacherSchedState extends State<TeacherSched>{

  late List<Term> termList;

  late OptionSection optionSection;

  @override
  void initState(){
    termList = [
      Term(year: 2020, term: false, weekNum: 16),
      Term(year: 2020, term: true, weekNum: 16),
      Term(year: 2021, term: false, weekNum: 16),
      Term(year: 2021, term: true, weekNum: 16),
      Term(year: 2022, term: false, weekNum: 16),
      Term(year: 2022, term: true, weekNum: 16),
      Term(year: 2023, term: false, weekNum: 16),
      Term(year: 2023, term: true, weekNum: 16),
      Term(year: 2024, term: false, weekNum: 16),
      Term(year: 2024, term: true, weekNum: 16),
      Term(year: 2025, term: false, weekNum: 16),
      Term(year: 2025, term: true, weekNum: 16),
    ];
    optionSection = OptionSection.fromTerm(termList);
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w, top: 20.h, bottom: 10.h),
          child: Text(
            'My Schedule',
            style: context.theme.textTheme.titleLarge?.copyWith(
              fontSize: 30.sp,
              fontFamily: StyleScheme.engFontFamily,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w, bottom: 10.h),
          child: Row(
            children: [
              ShadSelect<Tuple2<int,int>>(
                placeholder: Text(
                  '选择学期',
                  style: context.theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                options: getTextList([optionSection], context,),
                onChanged: (value) {
                  print('@@@@@@@@@@@@@@$value');
                },
                selectedOptionBuilder: (BuildContext context, Tuple2<int, int> value) {
                  return Text(
                    optionSection.options[value.item2],
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
              ),
              ShadSelect<Tuple2<int,int>>(
                placeholder: Text(
                  '选择周',
                  style: context.theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                options: getTextList([optionSection], context,),
                onChanged: (value) {
                  print('@@@@@@@@@@@@@@$value');
                },
                selectedOptionBuilder: (BuildContext context, Tuple2<int, int> value) {
                  return Text(
                    optionSection.options[value.item2],
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Expanded(
          child:  Padding(
            padding: EdgeInsets.only(left: 25.w, right: 60.w),
            child: getCourseSchedule(),
          ),
        )
      ],
    );
  }
  Widget getCourseSchedule(){
    return TimePlanner(
      setTimeOnAxis: false,
      style: TimePlannerStyle(
        cellHeight: (50.h).toInt(),
        cellWidth: (150.w).toInt(),
      ),
      startHour: 8,
      endHour: 21,
      headers: [
        TimePlannerTitle(
          title: 'Mon',
          titleStyle: context.theme.textTheme.titleMedium?.copyWith(
            fontSize: 19.sp,
            fontWeight: FontWeight.w500,
            fontFamily: StyleScheme.engFontFamily,
          ),
        ),
        TimePlannerTitle(title: 'Tue',
          titleStyle: context.theme.textTheme.titleMedium?.copyWith(
            fontSize: 19.sp,
            fontWeight: FontWeight.w500,
            fontFamily: StyleScheme.engFontFamily,
          ),
        ),
        TimePlannerTitle(title: 'Wed',
          titleStyle: context.theme.textTheme.titleMedium?.copyWith(
            fontSize: 19.sp,
            fontWeight: FontWeight.w500,
            fontFamily: StyleScheme.engFontFamily,
          ),
        ),
        TimePlannerTitle(title: 'Thu',
          titleStyle: context.theme.textTheme.titleMedium?.copyWith(
            fontSize: 19.sp,
            fontWeight: FontWeight.w500,
            fontFamily: StyleScheme.engFontFamily,
          ),
        ),
        TimePlannerTitle(title: 'Fri',
          titleStyle: context.theme.textTheme.titleMedium?.copyWith(
            fontSize: 19.sp,
            fontWeight: FontWeight.w500,
            fontFamily: StyleScheme.engFontFamily,
          ),
        ),
        TimePlannerTitle(title: 'Sat',
          titleStyle: context.theme.textTheme.titleMedium?.copyWith(
            fontSize: 19.sp,
            fontWeight: FontWeight.w500,
            fontFamily: StyleScheme.engFontFamily,
          ),
        ),
      ],
      tasks: [
        TimePlannerTask(
          // background color for task
          color: Colors.purple,
          // day: Index of header, hour: Task will be begin at this hour
          // minutes: Task will be begin at this minutes
          dateTime: TimePlannerDateTime(day: 0, hour: 8, minutes: 30),
          // Minutes duration of task
          minutesDuration: 120,
          // Days duration of task (use for multi days task)
          daysDuration: 1,
          onTap: () {},
          child: Text(
            'this is a task',
            style: TextStyle(color: Colors.grey[350], fontSize: 12),
          ),
        ),
      ],
    );
  }
}