enum TimeScale{
  YEAR,
  TERM,
  WEEK,
}

class ChartData{
  final int year;
  final TimeScale? term;
  final int? month;
  final int? week;
  TimeScale scale;
  List<int> xList;
  List<double> yList;

  ChartData({
    required this.year,
    this.month,
    this.term,
    this.week,
    required this.scale,
    required this.xList,
    required this.yList,
  });

  ChartData.term({
    required this.year,
    required this.term,
    this.month,
    this.week,
    required this.xList,
    required this.yList,
  }) :scale = TimeScale.TERM;
}