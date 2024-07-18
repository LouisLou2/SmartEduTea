import 'package:smart_edu_tea/state/basic_info_prov.dart';
import 'package:smart_edu_tea/state/classroom_apply_prov.dart';
import 'package:smart_edu_tea/state/course_detail_prov.dart';
import 'package:smart_edu_tea/state/course_list_prov.dart';
import 'package:smart_edu_tea/state/page_prov.dart';
import 'package:smart_edu_tea/state/sidebar_prov.dart';
import 'package:smart_edu_tea/state/student_score_prov.dart';
import 'package:smart_edu_tea/state/theme_prov.dart';
import 'package:smart_edu_tea/state/user_prov.dart';

import 'course_sched_prov.dart';
import 'fault_record_prov.dart';

class ProvManager {
  static late ThemeProv themeProv;
  static late PageProv pageProv;
  static late SidebarProv sidebarProv;
  static late UserProv userProv;
  static late CourseSchedProv courseSchedProv;
  static late CourseListProv courseListProv;
  static late FaultRecordProv faultReportProv;
  static late ClassroomRecordProv classroomRecordProvider;
  static late StudentScoreProv studentScoreProv;
  static late BasicDataProv basicDataProv;
  static late CourseDetailProv courseDetailProv;

  static void init(){
    themeProv = ThemeProv();
    sidebarProv = SidebarProv();
    pageProv = PageProv();
    userProv = UserProv();
    courseSchedProv = CourseSchedProv();
    courseListProv = CourseListProv();
    faultReportProv = FaultRecordProv();
    classroomRecordProvider = ClassroomRecordProv();
    studentScoreProv = StudentScoreProv();
    basicDataProv = BasicDataProv();
    courseDetailProv = CourseDetailProv();
  }
}