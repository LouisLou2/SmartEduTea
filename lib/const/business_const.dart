import 'package:smart_edu_tea/entity/course_span.dart';
import 'package:smart_edu_tea/entity/hour_min.dart';
import 'package:time_planner/time_planner.dart';

class BusinessConst {
  static int CourseBeginTime = 8;
  static int CourseEndTime = 22;
  static int weeksPerTerm = 20;

  static Map<int,CourseSpan> CourseBeginTimeMap = {
    1: CourseSpan(HourMin(8, 0), HourMin(8, 45)),
    2: CourseSpan(HourMin(8, 55), HourMin(9, 40)),
    3: CourseSpan(HourMin(10, 0), HourMin(10, 45)),
    4: CourseSpan(HourMin(10, 55), HourMin(11, 40)),
    5: CourseSpan(HourMin(14, 0), HourMin(14, 45)),
    6: CourseSpan(HourMin(14, 55), HourMin(15, 40)),
    7: CourseSpan(HourMin(16, 0), HourMin(16, 45)),
    8: CourseSpan(HourMin(16, 55), HourMin(17, 40)),
    9: CourseSpan(HourMin(19, 0), HourMin(19, 45)),
    10: CourseSpan(HourMin(19, 55), HourMin(20, 40)),
  };

  static TimePlannerDateTime getCourseBeginTime(int dayOfWeek, int periodFrom){
    assert(periodFrom >= 1 && periodFrom <= 10);
    return TimePlannerDateTime(
      day: dayOfWeek-1,
      hour: CourseBeginTimeMap[periodFrom]!.begin.hour,
      minutes: CourseBeginTimeMap[periodFrom]!.begin.min,
    );
  }

  static int getMinutesDuration(int periodFrom, int periodTo){
    assert(periodFrom >= 1 && periodFrom <= 10);
    assert(periodTo >= 1 && periodTo <= 10);
    return CourseBeginTimeMap[periodTo]!.end.toMinutes() - CourseBeginTimeMap[periodFrom]!.begin.toMinutes();
  }
}