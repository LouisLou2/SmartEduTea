import 'package:smart_edu_tea/entity/room_apply_record.dart';

class ClassroomApplyRecordResp{
  int recordSum;
  List<RoomApplyRecord> records;

  ClassroomApplyRecordResp({
    required this.recordSum,
    required this.records,
  });

  // fromJson factory method
  factory ClassroomApplyRecordResp.fromJson(Map<String, dynamic> json) {
    return ClassroomApplyRecordResp(
      recordSum: json['recordSum'],
      records: List<RoomApplyRecord>.from(json['records'].map((e) => RoomApplyRecord.fromJson(e))),
    );
  }
}