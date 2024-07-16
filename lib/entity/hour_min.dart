class HourMin {
  int hour;
  int min;

  HourMin(this.hour, this.min);

  @override
  String toString() {
    return '$hour:$min';
  }

  int toMinutes(){
    return hour*60+min;
  }
}