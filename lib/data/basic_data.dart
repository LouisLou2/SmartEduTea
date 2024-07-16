import '../entity/campus.dart';
import '../entity/school.dart';

class BasicData{
  static bool ok=false;
  static final nowYear=DateTime.now().year;

  static late final Campus campus;
  static late final bool nowTermPart;
  static late final int nowWeek;
  static late final int earliestTermYear;
  static late final int earliestTermPart;
  static late final List<School> schools;

  static void init({
    required Campus campus,
    required int nowWeek,
    required bool nowTermPart,
    required int earliestTermYear,
    required int earliestTermPart,
    required List<School> schools,
  }){
    campus=campus;
    nowWeek=nowWeek;
    nowTermPart=nowTermPart;
    earliestTermYear=earliestTermYear;
    earliestTermPart=earliestTermPart;
    schools=schools;
    ok=true;
  }
}