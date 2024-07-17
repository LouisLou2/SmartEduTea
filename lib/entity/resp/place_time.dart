import 'package:smart_edu_tea/entity/campus.dart';

import '../school.dart';

class PlaceTime {
  final List<Campus> campusList;
  final bool nowTermPart;
  final int nowWeek;
  final int earliestTermYear;
  final bool earliestTermPart;
  final List<School> schoolMajorList;

  PlaceTime(
    this.campusList,
    this.nowTermPart,
    this.earliestTermYear,
    this.earliestTermPart,
    this.nowWeek,
    this.schoolMajorList,
  );

  factory PlaceTime.fromJson(Map<String, dynamic> json) {
    return PlaceTime(
      ( json['campusVOList'] as List ).map<Campus>((e) => Campus.fromJson(e)).toList(),
      json['nowTermPart'],
      json['earliestTermYear'],
      json['earliestTermPart'],
      json['nowWeek'],
      ( json['schoolMajorList'] as List ).map<School>((e) => School.fromJson(e)).toList(),
    );
  }
}