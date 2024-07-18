class FormatUtil {
  static const monthShort = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  static const monthLong = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

  static String getPercent(double value){
    return '${(value * 100).toStringAsFixed(0)}%';
  }
  static String twoNumber(int value){
    return value.toString().padLeft(2, '0');
  }
  static String ymdStr(DateTime time){
    return '${time.year}-${twoNumber(time.month)}-${twoNumber(time.day)}';
  }
  static String doubleToStr(double value){
    return '${(value*100).toStringAsFixed(0)}%';
  }
  static String dateMonthShort(DateTime time){
    return '${time.day} ${monthShort[time.month-1]}. ${time.year}';
  }
  static String dateMonthLong(DateTime time){
    return '${time.day} ${monthLong[time.month-1]}. ${time.year}';
  }
  static String numComma(int value){
    return value.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }

  static String termStr(bool term){
    return term?'Fall':'Spring';
  }
}