import 'package:smart_edu_tea/util/format_util.dart';

import 'classroom_info.dart';

class RoomApplyRecord{
  int recordId;
  int year;
  bool termPart;
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

  String get resStr{
    switch (result) {
      case 0:
        return 'Approved';
      case 1:
        return 'Pending';
      case 2:
        return 'Rejected';
      default:
        return 'Unknown';
    }
  }

  String get reasonStr{
    // 1: 班会 2：团日活动 3：课程调节 4：团建
    // 中文
    switch (reason) {
      case 1:
        return '班会';
      case 2:
        return '团日活动';
      case 3:
        return '课程调节';
      case 4:
        return '团建';
      default:
        return 'Unknown';
    }
  }

  String get timeStr => '$year-${FormatUtil.termStr(termPart)}-Week$week-Day$dayOfWeek';
  String get periodStr => '$periodFrom - $periodTo';
  String get placeStr => classroomInfo.placeStr;
}