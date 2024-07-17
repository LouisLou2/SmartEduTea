import 'package:flutter/cupertino.dart';
import 'package:smart_edu_tea/const/app_param.dart';
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
  bool _isLoading = false;
  int recordSum = 0;
  int nowPage = 0;
  List<StudentBrief> students = []; // 某一页的学生
  Map<String, Score> scores = {};

  int get totalPage {
    int total = (recordSum / AppParam.pageSizeBig).ceil();
    return total == 0 ? 1 : total;
  }
  // 获取到的学生成绩列表, 顺序和students一致
  List<Score> get scoresPageList {
    List<Score> list = [];
    for(var stub in students){
      list.add(scores[stub.stuId]?? Score.emptyScore(stub.stuId));
    }
    return list;
  }

  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> newPageAndFetch(int pageIndex) async {
    setLoading(true);
    Result<StudentPatic> result = await CourseStudentsDs.getCourseStudents(nowCourseInstId, nowPage*AppParam.pageSizeBig, AppParam.pageSizeBig);
    if(result.isSuccess) {
      students = result.data!.students;
      recordSum = result.data!.studentSum;
      for (StudentBrief sb in students) {
        scores[sb.stuId] = Score(stuId: sb.stuId, totalScore: 0, regularScore: 0, examScore: 0);
      }
    }else {
      ToastHelper.showErrorWithouDesc('${result.resCode}');
    }
  }

  void setRegularScore(String stuId, int score) {
    scores[stuId]!.regularScore = score;
    calcTotalScore(stuId);
  }

  void setExamScore(String stuId, int score) {
    scores[stuId]!.examScore = score;
    calcTotalScore(stuId);
  }

  void calcTotalScore(String stuId) {
    scores[stuId]!.totalScore = (scores[stuId]!.regularScore*0.5 + scores[stuId]!.examScore*0.5).toInt();
    notifyListeners();
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
    scores = {};
    notifyListeners();
  }
}