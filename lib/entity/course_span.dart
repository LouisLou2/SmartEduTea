import 'package:smart_edu_tea/entity/hour_min.dart';

class CourseSpan{
  HourMin begin;
  HourMin end;

  CourseSpan(this.begin, this.end);

  @override
  String toString() {
    return '$begin-$end';
  }
}