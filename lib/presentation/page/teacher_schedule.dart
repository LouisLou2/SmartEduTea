import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu_tea/const/business_const.dart';
import 'package:smart_edu_tea/data/basic_data.dart';
import 'package:smart_edu_tea/entity/general/option_section.dart';
import 'package:smart_edu_tea/extension/context_extension.dart';
import 'package:smart_edu_tea/handler/course_sched_handler.dart';
import 'package:smart_edu_tea/presentation/widget/text_list.dart';
import 'package:smart_edu_tea/state/course_sched_prov.dart';
import 'package:smart_edu_tea/state/prov_manager.dart';
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

  final cProv = ProvManager.courseSchedProv;
  late List<Term> termList;
  late OptionSection YtOptions;
  late OptionSection WOptions;

  @override
  void initState(){
    setYearTermSection();
    YtOptions = OptionSection.fromTerm(termList);
    WOptions = OptionSection.fromWeek(BusinessConst.weeksPerTerm);
    super.initState();

    // 在initState中加载数据
    WidgetsBinding.instance.addPostFrameCallback((_) {
      CourseSchedHandler.enterCourseSched();
    });
  }

  void setYearTermSection(){
    int yearFrom = BasicData.earliestTermYear;
    int yearTo = BasicData.nowYear;
    termList = [];
    for(int i = yearTo;i>=yearFrom;--i){
      termList.add(Term(year: i, term: true,));
      termList.add(Term(year: i, term: false,));
    }
  }

  Tuple2<int,bool> getYearTerm(int index){
    int year = termList[index].year;
    bool term = termList[index].term;
    return Tuple2<int,bool>(year,term);
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
                initialValue: Tuple2<int,int>(0,0),
                placeholder: Text(
                  '选择学期',
                  style: context.theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                options: getTextList([YtOptions], context,),
                onChanged: (value) {
                  final yearTerm=getYearTerm(value.item2);
                  cProv.setYearTerm(yearTerm.item1, yearTerm.item2);
                 },
                selectedOptionBuilder: (BuildContext context, Tuple2<int, int> value) {
                  return Text(
                    YtOptions.options[value.item2],
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
              ),
              ShadSelect<Tuple2<int,int>>(
                initialValue: Tuple2<int,int>(0,0),
                placeholder: Text(
                  '选择周',
                  style: context.theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                options: getTextList([WOptions], context,),
                onChanged: (value) {
                  cProv.setWeek(value.item2);
                },
                selectedOptionBuilder: (BuildContext context, Tuple2<int, int> value) {
                  return Text(
                    WOptions.options[value.item2],
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
              ),
              OutlinedButton(
                onPressed: (){
                  CourseSchedHandler.updateCourseUsingProv();
                },
                child: Text(
                  'Inquire',
                  style: context.theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child:  Padding(
            padding: EdgeInsets.only(left: 25.w, right: 60.w),
            child: Selector<CourseSchedProv, int>(
              selector: (context, prov) => prov.tasks.length,
              shouldRebuild: (prev, next) => true,
              builder: (context, week, child){
                return getCourseSchedule(cProv.tasks);
              },
            ),
          ),
        )
      ],
    );
  }
  Widget getCourseSchedule(List<TimePlannerTask> tasks){
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
      tasks: tasks,
    );
  }
}