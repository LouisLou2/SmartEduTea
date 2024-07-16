class Major{
  int majorId;
  String majorName;

  Major({required this.majorId, required this.majorName});

  Major.fromJson(Map<String, dynamic> json):
    majorId = json['majorId'],
    majorName = json['majorName'];

}