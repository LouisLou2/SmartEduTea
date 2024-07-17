class StudentBrief {
  String stuId;
  String stuName;
  String majorName;

  StudentBrief({
    required this.stuId,
    required this.stuName,
    required this.majorName,
  });

  factory StudentBrief.fromJson(Map<String, dynamic> json) {
    return StudentBrief(
      stuId: json['stuId'],
      stuName: json['stuName'],
      majorName: json['majorName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stuId': stuId,
      'stuName': stuName,
      'majorName': majorName,
    };
  }
}