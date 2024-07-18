import 'edu_exp.dart';

class Teacher {
  String teacherId;
  String teacherName;
  String phone;
  DateTime hireDate;
  String type;
  bool gender;
  int schoolId;
  String schoolName;
  int majorId;
  String majorName;
  String title;
  String bachelor;
  String email;
  String desc;
  String researchFocus;
  String picUrl;
  String address;
  int aaoOfficeId;
  String aaoOfficeName;
  List<EduExp> eduExpList;
  String identity;

  Teacher({
    required this.teacherId,
    required this.teacherName,
    required this.phone,
    required this.hireDate,
    required this.type,
    required this.gender,
    required this.schoolId,
    required this.schoolName,
    required this.majorId,
    required this.majorName,
    required this.title,
    required this.bachelor,
    required this.email,
    required this.desc,
    required this.researchFocus,
    required this.picUrl,
    required this.address,
    required this.aaoOfficeId,
    required this.aaoOfficeName,
    required this.eduExpList,
    required this.identity,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      teacherId: json['teacherId'],
      teacherName: json['teacherName'],
      phone: json['phone'],
      hireDate: DateTime.parse(json['hireDate']),
      type: json['type'],
      gender: json['gender'],
      schoolId: json['schoolId'],
      schoolName: json['schoolName'],
      majorId: json['majorId'],
      majorName: json['majorName'],
      title: json['title'],
      bachelor: json['bachelor'],
      email: json['email'],
      desc: json['description'],  // 修改这里，从 "desc" 改为 "description"
      researchFocus: json['researchFocus'],
      picUrl: json['picUrl'],
      address: json['address'],
      aaoOfficeId: json['aaoOfficeId'],
      aaoOfficeName: json['aaoOfficeName'],
      eduExpList: (json['eduExpList'] as List)
          .map((item) => EduExp.fromJson(item))
          .toList(),
      identity: json['identity'],
    );
  }

  String get firstNameLetter{
    return teacherName[0];
  }
}