class CourseBrief {
  int courseInstId;
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
  int totalClassHour;

  CourseBrief({
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
    required this.totalClassHour,
  });

  factory CourseBrief.fromJson(Map<String, dynamic> json) {
    return CourseBrief(
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
      totalClassHour: json['totalClassHour'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'courseInstId': courseInstId,
      'name': name,
      'courseType': courseType,
      'courseCate': courseCate,
      'courseFor': courseFor,
      'credit': credit,
      'gradeLevel': gradeLevel,
      'schoolId': schoolId,
      'schoolName': schoolName,
      'coursePic': coursePic,
      'year': year,
      'termPart': termPart,
      'totalClassHour': totalClassHour,
    };
  }

  String get creditStr => (credit/10).toStringAsFixed(1);
}