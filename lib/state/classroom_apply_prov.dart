import 'package:flutter/material.dart';
import 'package:smart_edu_tea/const/app_param.dart';
import 'package:smart_edu_tea/datasourse/imple/teacher_course_ds.dart';
import 'package:smart_edu_tea/entity/room_apply_record.dart';
import 'package:smart_edu_tea/presentation/helper/toast_helper.dart';
import '../entity/general/result.dart';
import '../entity/resp/classroom_apply_record.dart';

class ClassroomRecordProv with ChangeNotifier {

  int recordSum = 0;
  int nowPage = 0;
  List<RoomApplyRecord> records = [];
  bool _isLoading = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  int get totalPage {
    int res=(recordSum/AppParam.pageSize).ceil();
    return res==0?1:res;
  }
  //
  Future<void> newPageAndFetch(int page) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();
    try {
      Result<ClassroomApplyRecordResp> result = await TeacherCourseDs.getClassroomApplyRecord(page*AppParam.pageSize, page*AppParam.pageSize);
      if (result.isSuccess) {
        final resp = result.data!;
        recordSum = resp.recordSum;
        records = resp.records;
        nowPage = page;
      } else {
        _errorMessage = 'Error: ${result.resCode}';
      }
    } catch (e) {
      _errorMessage = 'An error occurred: ${e.toString()}';
      ToastHelper.showWarningWithouDesc(_errorMessage);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}