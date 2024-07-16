import 'package:flutter/cupertino.dart';

import '../entity/course_brief.dart';

class CourseListProv extends ChangeNotifier {
  List<CourseBrief> courses = [];

  void setCourses(List<CourseBrief> courses){
    this.courses = courses;
    notifyListeners();
  }

}