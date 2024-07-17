class EduExp {
  DateTime fromDate;
  DateTime toDate;
  String uniName;
  String majorName;
  String bechelor;

  EduExp({
    required this.fromDate,
    required this.toDate,
    required this.uniName,
    required this.majorName,
    required this.bechelor,
  });

  EduExp.fromJson(Map<String, dynamic> json)
      : fromDate = DateTime.parse(json['fromDate']),
        toDate = DateTime.parse(json['toDate']),
        uniName = json['uniName'],
        majorName = json['majorName'],
        bechelor = json['bechelor'];
}