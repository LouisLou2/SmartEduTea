import 'major.dart';

class School{
  int schoolId;
  String schoolName;
  List<Major> majors;

  School({required this.schoolId, required this.schoolName, required this.majors});

  School.fromJson(Map<String, dynamic> json):
    schoolId = json['schoolId'],
    schoolName = json['schoolName'],
    majors = (json['majors'] as List).map((e) => Major.fromJson(e)).toList();
}