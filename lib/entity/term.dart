class Term{
  int year;
  bool term;

  Term({
    required this.year,
    required this.term,
  });

  Term.fromJson(Map<String, dynamic> json)
      : year = json['year'],
        term = json['term'];

  String get termStr => term ? 'Fall' : 'Spring';
  @override
  String toString() => '$year ($termStr)';
}