class CourseTask {
  final int courseInstSectionId;
  final String courseInstId;
  final String courseName;
  final List<String> courseTeacherName;
  final String classroomName;
  final int dayOfWeek;
  final int periodFrom;
  final int periodTo;

  CourseTask({
    required this.courseInstSectionId,
    required this.courseInstId,
    required this.courseName,
    required this.courseTeacherName,
    required this.classroomName,
    required this.dayOfWeek,
    required this.periodFrom,
    required this.periodTo,
  });

  // fromJson factory method
  factory CourseTask.fromJson(Map<String, dynamic> json) {
    return CourseTask(
      courseInstSectionId: json['courseInstSectionId'],
      courseInstId: json['courseInstId'],
      courseName: json['courseName'],
      courseTeacherName: List<String>.from(json['courseTeacherName']),
      classroomName: json['classroomName'],
      dayOfWeek: json['dayOfWeek'],
      periodFrom: json['periodFrom'],
      periodTo: json['periodTo'],
    );
  }
}