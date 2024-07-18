class ClassroomBrief{
  int classroomId;
  String classroomName;

  ClassroomBrief({
    required this.classroomId,
    required this.classroomName,
  });

  // factory
  factory ClassroomBrief.fromJson(Map<String, dynamic> json) {
    return ClassroomBrief(
      classroomId: json['classroomId'],
      classroomName: json['classroomName'],
    );
  }

}