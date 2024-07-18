class ClassroomInfo{
  int classroomId;
  String campusName;
  String building;
  String classroomName;

  ClassroomInfo({
    required this.classroomId,
    required this.campusName,
    required this.building,
    required this.classroomName,
  });

  // fromJson factory method
  factory ClassroomInfo.fromJson(Map<String, dynamic> json) {
    return ClassroomInfo(
      classroomId: json['classroomId'],
      campusName: json['campusName'],
      building: json['building'],
      classroomName: json['classroomName'],
    );
  }

  String get placeStr=> '$campusName $building $classroomName';
}