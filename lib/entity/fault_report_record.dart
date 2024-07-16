class FaultReportRecord{
  DateTime reportTime;
  String campusName;
  String building;
  String classroomName;
  String faultDesc;
  String faultType;
  int status;

  FaultReportRecord({
    required this.reportTime,
    required this.campusName,
    required this.building,
    required this.classroomName,
    required this.faultDesc,
    required this.faultType,
    required this.status,
  });

  // fromJson factory method
  factory FaultReportRecord.fromJson(Map<String, dynamic> json) {
    return FaultReportRecord(
      reportTime: DateTime.parse(json['reportTime']),
      campusName: json['campusName'],
      building: json['building'],
      classroomName: json['classroomName'],
      faultDesc: json['faultDesc'],
      faultType: json['faultType'],
      status: json['status'],
    );
  }
}