import 'package:flutter/cupertino.dart';
import 'package:smart_edu_tea/const/data_status.dart';
import 'package:smart_edu_tea/entity/course_detail.dart';
import 'package:smart_edu_tea/presentation/helper/toast_helper.dart';

import '../datasourse/imple/teacher_course_ds.dart';
import '../entity/general/result.dart';

class CourseDetailProv extends ChangeNotifier{

  int courseInstId = 0;

  DataStatus _status= DataStatus.initial;

  late CourseDetail detail;

  DataStatus get status => _status;

  void setStatus(DataStatus status){
    _status = status;
    notifyListeners();
  }
  void setCourseInstId(int courseInstId){
    this.courseInstId = courseInstId;
  }

  Future<void> fetchCourseDetail() async {
    setStatus(DataStatus.loading);
    Result<CourseDetail> res = await TeacherCourseDs.getCourseDetail(courseInstId);
    if(res.isSuccess){
      detail = res.data!;
      setStatus(DataStatus.success);
    }else{
      ToastHelper.showWarningWithouDesc('${res.resCode}');
      setStatus(DataStatus.failure);
    }
  }
}