class Campus {
  final int campusId;
  final String campusName;
  final List<String> buildings;

  Campus(this.campusId, this.campusName, this.buildings);

  factory Campus.fromJson(Map<String, dynamic> json) {
    return Campus(
      json['campusId'],
      json['campusName'],
      json['buildings'].cast<String>(),
    );
  }
}