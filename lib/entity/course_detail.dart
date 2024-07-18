import 'chapter1.dart';

class CourseDetail {
  String courseInstId;
  String name;
  String courseType;
  String courseCate;
  String courseFor;
  int credit;
  int gradeLevel;
  int schoolId;
  String schoolName;
  String coursePic;
  int year;
  bool termPart;
  int totalClassTotal;
  String instructorMsg;
  String overview;
  String target;
  String assessMethod;
  String methodDetail;
  int maxNum;
  List<Chapter1> chapterList;

  CourseDetail({
    required this.courseInstId,
    required this.name,
    required this.courseType,
    required this.courseCate,
    required this.courseFor,
    required this.credit,
    required this.gradeLevel,
    required this.schoolId,
    required this.schoolName,
    required this.coursePic,
    required this.year,
    required this.termPart,
    required this.totalClassTotal,
    required this.instructorMsg,
    required this.overview,
    required this.target,
    required this.assessMethod,
    required this.methodDetail,
    required this.maxNum,
    required this.chapterList,
  });

  factory CourseDetail.fromJson(Map<String, dynamic> json) {
    var list = json['chapterList'] as List;
    List<Chapter1> chapters = list.map((i) => Chapter1.fromJson(i)).toList();

    return CourseDetail(
      courseInstId: json['courseInstId'],
      name: json['name'],
      courseType: json['courseType'],
      courseCate: json['courseCate'],
      courseFor: json['courseFor'],
      credit: json['credit'],
      gradeLevel: json['gradeLevel'],
      schoolId: json['schoolId'],
      schoolName: json['schoolName'],
      coursePic: json['coursePic'],
      year: json['year'],
      termPart: json['termPart'],
      totalClassTotal: json['totalClassTotal'],
      instructorMsg: json['instructorMsg'],
      overview: json['overview'],
      target: json['target'],
      assessMethod: json['assessMethod'],
      methodDetail: json['methodDetal'],
      maxNum: json['maxNum'],
      chapterList: chapters,
    );
  }
}