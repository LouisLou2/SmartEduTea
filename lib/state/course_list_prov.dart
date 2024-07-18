import 'package:flutter/cupertino.dart';
import 'package:smart_edu_tea/const/data_status.dart';

import '../data/basic_data.dart';
import '../datasourse/imple/teacher_course_ds.dart';
import '../entity/course_brief.dart';
import '../entity/general/result.dart';
import '../presentation/helper/toast_helper.dart';

class CourseListProv extends ChangeNotifier {

  DataStatus _status = DataStatus.initial;

  List<CourseBrief> courses = [];

  DataStatus get status => _status;

  void setStatus(DataStatus status){
    _status = status;
    notifyListeners();
  }

  void setCourses(List<CourseBrief> courses){
    this.courses = courses;
  }

  Future<void> updateCourseList() async{
    setStatus(DataStatus.loading);
    int nowYear = BasicData.nowYear;
    bool nowTermPart = BasicData.nowTermPart;

    Result<List<CourseBrief>> courses = await TeacherCourseDs.getCourseBriefList(nowYear, nowTermPart);
    if(courses.isSuccess){
      setCourses(courses.data!);
      setStatus(DataStatus.success);
    }else{
      ToastHelper.showErrorWithouDesc('${courses.resCode}');
      setStatus(DataStatus.failure);
    }
  }

}