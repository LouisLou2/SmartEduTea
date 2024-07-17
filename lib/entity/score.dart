class Score {
  String stuId;
  int regularScore;
  int examScore;
  int totalScore;

  Score({
    required this.stuId,
    required this.regularScore,
    required this.examScore,
    required this.totalScore,
  });

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      stuId: json['stuId'],
      regularScore: json['regularScore'],
      examScore: json['examScore'],
      totalScore: json['totalScore'],
    );
  }

  factory Score.emptyScore(String stuId) {
    return Score(
      stuId: stuId,
      regularScore: 0,
      examScore: 0,
      totalScore: 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stuId': stuId,
      'regularScore': regularScore,
      'examScore': examScore,
      'totalScore': totalScore,
    };
  }
}