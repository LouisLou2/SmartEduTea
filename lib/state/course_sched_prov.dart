import 'package:flutter/material.dart';
import 'package:smart_edu_tea/data/basic_data.dart';
import 'package:time_planner/time_planner.dart';

class CourseSchedProv with ChangeNotifier {
  int selectedWeek = 0;
  bool selectedTerm = false;
  int selectedYear = BasicData.nowYear;

  List<TimePlannerTask> tasks = [];

  void setWeek(int week){
    selectedWeek = week+1;// index从0开始，但是那里是从1
  }

  void setYearTerm(int year, bool term){
    selectedYear = year;
    selectedTerm = term;
  }

  void setTime (int year, bool term, int week){
    selectedYear = year;
    selectedTerm = term;
    selectedWeek = week;
  }

  void setTasks(List<TimePlannerTask> tasks){
    this.tasks = tasks;
    notifyListeners();
  }
}