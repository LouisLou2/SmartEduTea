class Term{
  int year;
  bool term;
  int weekNum;

  Term({
    required this.year,
    required this.term,
    required this.weekNum,
  });

  Term.fromJson(Map<String, dynamic> json)
      : year = json['year'],
        term = json['term'],
        weekNum = json['week_num'];

  String get termStr => term ? 'Fall' : 'Spring';
  @override
  String toString() => '$year ($termStr)';
}