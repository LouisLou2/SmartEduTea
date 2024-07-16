import 'classroom_info.dart';

class RoomApplyRecord{
  int recordId;
  int year;
  int termPart;
  int week;
  int dayOfWeek;
  int periodFrom;
  int periodTo;
  ClassroomInfo classroomInfo;
  int result;
  String actName;
  int reason;
  String reasonDetail;

  RoomApplyRecord({
    required this.recordId,
    required this.year,
    required this.termPart,
    required this.week,
    required this.dayOfWeek,
    required this.periodFrom,
    required this.periodTo,
    required this.classroomInfo,
    required this.result,
    required this.actName,
    required this.reason,
    required this.reasonDetail,
  });

  // fromJson factory method
  factory RoomApplyRecord.fromJson(Map<String, dynamic> json) {
    return RoomApplyRecord(
      recordId: json['recordId'],
      year: json['year'],
      termPart: json['termPart'],
      week: json['week'],
      dayOfWeek: json['dayOfWeek'],
      periodFrom: json['periodFrom'],
      periodTo: json['periodTo'],
      classroomInfo: ClassroomInfo.fromJson(json['classroomInfo']),
      result: json['result'],
      actName: json['actName'],
      reason: json['reason'],
      reasonDetail: json['reasonDetail'],
    );
  }
}