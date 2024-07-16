import 'package:smart_edu_tea/state/course_list_prov.dart';
import 'package:smart_edu_tea/state/prov_manager.dart';

import '../data/basic_data.dart';
import '../datasourse/imple/teacher_course_ds.dart';
import '../entity/course_brief.dart';
import '../entity/general/result.dart';
import '../presentation/helper/toast_helper.dart';

class CourseListHandler {
  static final CourseListProv cProv = ProvManager.courseListProv;

  static Future<void> updateCourseList() async{
    int nowYear = BasicData.nowYear;
    bool nowTermPart = BasicData.nowTermPart;

    Result<List<CourseBrief>> courses = await TeacherCourseDs.getCourseBriefList(nowYear, nowTermPart);
    if(courses.isSuccess){
      cProv.setCourses(courses.data!);
    }else{
      ToastHelper.showErrorWithouDesc('${courses.resCode}');
    }
  }
}