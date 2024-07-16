import 'package:smart_edu_tea/data/basic_data.dart';
import 'package:smart_edu_tea/datasourse/imple/teacher_course_ds.dart';
import 'package:smart_edu_tea/entity/course_task.dart';
import 'package:smart_edu_tea/entity/ui_tool/ui_entity_trans.dart';
import 'package:smart_edu_tea/state/prov_manager.dart';
import 'package:time_planner/time_planner.dart';

import '../entity/general/result.dart';
import '../presentation/helper/toast_helper.dart';

class CourseSchedHandler{

  static final cProv = ProvManager.courseSchedProv;

  static void enterCourseSched(){
    int nowYear=BasicData.nowYear;
    bool nowTermPart=BasicData.nowTermPart;
    int nowWeek=BasicData.nowWeek;
    cProv.setTime(nowYear, nowTermPart, nowWeek);
    updateCourseUsingProv();
  }

  static Future<void> updateCourseSched(int year, bool termPart, int week) async{
    cProv.setTime(year, termPart, week);
    updateCourseUsingProv();
  }

  static Future<void> updateCourseUsingProv() async{
    Result<List<CourseTask>> tasks = await TeacherCourseDs.getCourseTable(cProv.selectedYear, cProv.selectedTerm, cProv.selectedWeek);
    if(tasks.isSuccess){
      List<TimePlannerTask> timeTasks=tasks.data!.map((e)=>UiEntityTrans.toTimePlannerTask(e)).toList();
      cProv.setTasks(timeTasks);
    }else{
      ToastHelper.showErrorWithouDesc('${tasks.resCode}');
    }
  }
}