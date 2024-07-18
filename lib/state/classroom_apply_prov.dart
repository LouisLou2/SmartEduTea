import 'package:flutter/material.dart';
import 'package:smart_edu_tea/const/app_param.dart';
import 'package:smart_edu_tea/const/data_status.dart';
import 'package:smart_edu_tea/entity/room_apply_record.dart';
import 'package:smart_edu_tea/presentation/helper/toast_helper.dart';
import '../datasourse/imple/facility_ds.dart';
import '../entity/general/result.dart';
import '../entity/resp/classroom_apply_record.dart';

class ClassroomRecordProv with ChangeNotifier {

  int recordSum = 0;
  int _nowPage = 0;
  DataStatus _status = DataStatus.initial;
  List<RoomApplyRecord> records = [];

  String _errorMessage = '';
  int openIndex=0;

  String get errorMessage => _errorMessage;
  int get totalPage {
    int res=(recordSum/AppParam.pageSize).ceil();
    return res==0?1:res;
  }
  DataStatus get status => _status;
  int get nowPage => _nowPage;

  void setOpenIndex(int index){
    openIndex=index;
    notifyListeners();
  }

  void setStatus(DataStatus status) {
    _status = status;
    notifyListeners();
  }

  void setNowPage(int page) {
    _nowPage = page;
    notifyListeners();
  }

  //
  Future<void> fetchRecordList() async {
    _errorMessage = '';
    setStatus(DataStatus.loading);
    Result<ClassroomApplyRecordResp> result = await FacilityDs.getClassroomApplyRecord(_nowPage*AppParam.pageSize, AppParam.pageSize);
    if (result.isSuccess) {
      final resp = result.data!;
      recordSum = resp.recordSum;
      records = resp.records;
      setStatus(DataStatus.success);
    } else {
      _errorMessage = 'Error: ${result.resCode}';
      ToastHelper.showErrorWithouDesc(_errorMessage);
      setStatus(DataStatus.failure);
    }
  }
}