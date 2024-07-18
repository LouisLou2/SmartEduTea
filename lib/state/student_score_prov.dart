import 'package:flutter/cupertino.dart';
import 'package:smart_edu_tea/const/app_param.dart';
import 'package:smart_edu_tea/const/data_status.dart';
import 'package:smart_edu_tea/datasourse/imple/course_student.dart';
import 'package:smart_edu_tea/entity/resp/student_patic.dart';
import 'package:smart_edu_tea/entity/student_brief.dart';
import 'package:smart_edu_tea/entity/score.dart';
import 'package:dio/dio.dart';
import 'package:smart_edu_tea/entity/general/resp.dart';
import 'package:smart_edu_tea/entity/general/result.dart';
import 'package:smart_edu_tea/helper/global_exception_handler.dart';
import 'package:smart_edu_tea/presentation/helper/toast_helper.dart';


class StudentScoreProv extends ChangeNotifier {
  int nowCourseInstId=0;
  List<StudentBrief> students = [];

  List<int> equipPage = [];
  Map<String, Score> scores = {};

  DataStatus _status = DataStatus.initial;

  int recordSum = 0;
  int nowPage = 0;

  bool _cellEdited = false;

  DataStatus get status => _status;

  int get totalPage {
    int total = (recordSum / AppParam.pageSizeBig).ceil();
    return total == 0 ? 1 : total;
  }

  bool get cellEdited => _cellEdited;

  void setCourseInstId(int courseInstId) {
    nowCourseInstId = courseInstId;
  }

  void setCellEdited() {
    _cellEdited = !_cellEdited;
    notifyListeners();
  }

  void setStatus(DataStatus status) {
    _status = status;
    notifyListeners();
  }

  void setPage(int page) {
    nowPage = page;
    notifyListeners();
  }


  // 获取到的学生成绩列表, 顺序和students一致
  List<Score> get scoresPageList {
    List<Score> scoresList = [];
    for (StudentBrief sb in students) {
      scoresList.add(scores[sb.stuId]!);
    }
    return scoresList;
  }

  // Future<void> getPage(int page) async {
  //   if(equipPage.contains(page)){
  //     nowPage = page;
  //     // 更新students
  //     setCellEdited();
  //     return;
  //   }else{
  //     nowPage = page;
  //     await fetchScores();
  //   }
  // }


  Future<void> fetchScores() async {
    setStatus(DataStatus.loading);
    Result<StudentPatic> result = await CourseStudentsDs.getCourseStudents(nowCourseInstId, nowPage*AppParam.pageSizeBig, AppParam.pageSizeBig);
    if(result.isSuccess) {
      students = result.data!.students;
      recordSum = result.data!.studentSum;
      for (StudentBrief sb in students) {
        scores[sb.stuId] = Score(stuId: sb.stuId, totalScore: 0, regularScore: 0, examScore: 0);
      }
      equipPage.add(nowPage);
      setStatus(DataStatus.success);
    }else {
      ToastHelper.showErrorWithouDesc('${result.resCode}');
      setStatus(DataStatus.failure);
    }
  }

  void updateScore(int stuIndex, bool type, int newScore){
    String stuId = students[stuIndex].stuId;
    late int old;
    if(type){
      // 平时分
      old=scores[students[stuIndex].stuId]!.regularScore;
      if(old==newScore)return;
      scores[students[stuIndex].stuId]!.regularScore = newScore;
      calcTotalScore(stuId);
      print(scores[stuId]!.totalScore);
      setCellEdited();
    }else{
      old = scores[students[stuIndex].stuId]!.examScore;
      if(old==newScore)return;
      scores[students[stuIndex].stuId]!.examScore = newScore;
      calcTotalScore(stuId);
      setCellEdited();
    }
    // calcTotalScore(students[stuIndex].stuId);
  }

  void calcTotalScore(String stuId) {
    scores[stuId]!.totalScore = (scores[stuId]!.regularScore*0.5 + scores[stuId]!.examScore*0.5).toInt();
  }

  void uploadScores() async {
    List<Score> stuScores = [];
    for (Score score in scores.values) {
      stuScores.add(score);
    }
    Result<void> result = await CourseStudentsDs.uploadScores(nowCourseInstId, stuScores);
    if(result.isSuccess) {
      ToastHelper.showSuccess('上传成功');
    }else {
      ToastHelper.showErrorWithouDesc('${result.resCode}');
    }
  }

  void clearData() {
    recordSum = 0;
    nowPage = 0;
    students = [];
    equipPage=[];
    scores = {};
  }
}