import 'package:smart_edu_tea/util/format_util.dart';

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
    this.faultType = '常规错误',
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
      // faultType: json['faultType'],
      status: json['status'],
    );
  }

  String get placeStr=> '$campusName $building $classroomName';

  String get reportTimeStr => FormatUtil.ymdStr(reportTime);
}