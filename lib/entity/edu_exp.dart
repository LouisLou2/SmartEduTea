class EduExp {
  DateTime fromDate;
  DateTime toDate;
  String uniName;
  String majorName;
  String bachelor;

  EduExp({
    required this.fromDate,
    required this.toDate,
    required this.uniName,
    required this.majorName,
    required this.bachelor,
  });

  EduExp.fromJson(Map<String, dynamic> json)
      : fromDate = DateTime.parse(json['fromDate']),
        toDate = DateTime.parse(json['toDate']),
        uniName = json['uniName'],
        majorName = json['majorName'],
        bachelor = json['bachelor'];
}