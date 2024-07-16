import 'package:smart_edu_tea/entity/campus.dart';

import '../school.dart';

class PlaceTime {
  final Campus campus;
  final bool nowTermPart;
  final int nowWeek;
  final int earliestTermYear;
  final int earliestTermPart;
  final List<School> schoolMajorList;

  PlaceTime(
    this.campus,
    this.nowTermPart,
    this.earliestTermYear,
    this.earliestTermPart,
      this.nowWeek,
    this.schoolMajorList,
  );

  factory PlaceTime.fromJson(Map<String, dynamic> json) {
    return PlaceTime(
      Campus.fromJson(json['campus']),
      json['nowTermPart'],
      json['earliestTermYear'],
      json['earliestTermPart'],
      json['nowWeek'],
      ( json['schoolMajorList'] as List ).map<School>((e) => School.fromJson(e)).toList(),
    );
  }
}