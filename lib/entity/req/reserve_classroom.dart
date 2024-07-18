class ReserveClassroomReq{
  String name;
  String phoneNumber;
  int classroomId;
  int year;
  bool termPart;
  int week;
  int dayOfWeek;
  int periodFrom;
  int periodTo;
  String reason;
  String reasonDetail;

  ReserveClassroomReq({
    required this.name,
    required this.phoneNumber,
    required this.classroomId,
    required this.year,
    required this.termPart,
    required this.week,
    required this.dayOfWeek,
    required this.periodFrom,
    required this.periodTo,
    required this.reason,
    required this.reasonDetail,
  });

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'classroomId': classroomId,
      'year': year,
      'termPart': termPart,
      'week': week,
      'dayOfWeek': dayOfWeek,
      'periodFrom': periodFrom,
      'periodTo': periodTo,
      'reason': reason,
      'reasonDetail': reasonDetail,
    };
  }
}