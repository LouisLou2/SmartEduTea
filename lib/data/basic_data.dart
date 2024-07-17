import '../entity/campus.dart';
import '../entity/school.dart';

class BasicData{
  static bool ok=false;
  static final nowYear=DateTime.now().year;

  static late final List<Campus> campusList;
  static late final bool nowTermPart;
  static late final int nowWeek;
  static late final int earliestTermYear;
  static late final bool earliestTermPart;
  static late final List<School> schools;

  static void init({
    required List<Campus> campuses1,
    required int nowWeek1,
    required bool nowTermPart1,
    required int earliestTermYear1,
    required bool earliestTermPart1,
    required List<School> schools1,
  }){
    campusList=campuses1;
    nowWeek=nowWeek1;
    nowTermPart=nowTermPart1;
    earliestTermYear=earliestTermYear1;
    earliestTermPart=earliestTermPart1;
    schools=schools1;
    ok=true;
  }
}