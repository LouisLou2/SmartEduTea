import 'package:flutter/material.dart';
import 'package:smart_edu_tea/const/data_status.dart';
import 'package:smart_edu_tea/presentation/helper/toast_helper.dart';

import '../datasourse/imple/fault_info_ds.dart';
import '../entity/fault_report_record.dart';
import '../entity/general/tuple2.dart';

class ReportStatus {
  static int all = 0;
  static int pending = 1;
  static int processing = 2;
  static int finished = 3;
}


class FaultRecordProv with ChangeNotifier {

  Tuple2<int,int> _chosenRecordInd=Tuple2(0,0);

  int nowWatchingType = ReportStatus.all;

  List<List<FaultReportRecord>> _records = [
    [], [], [], [],
  ];
  List<DataStatus> _statusList = [
    DataStatus.initial,
    DataStatus.initial,
    DataStatus.initial,
    DataStatus.initial,
  ];

  FaultReportRecord get chosenRecord => _records[_chosenRecordInd.item1][_chosenRecordInd.item2];

  List<FaultReportRecord> getRecords(int status) {
    return _records[status];
  }

  FaultReportRecord getRecord(int status, int ind) {
    return _records[status][ind];
  }

  DataStatus getStatus(int status) {
    return _statusList[status];
  }

  int getRecordSum(int status) {
    return _records[status].length;
  }

  void setStatus(int status, DataStatus dataStatus) {
    _statusList[status] = dataStatus;
    notifyListeners();
  }

  void setNowWatchingType(int status) {
    nowWatchingType = status;
  }

  void setChosenRecordInd(int type, int ind){
    _chosenRecordInd = Tuple2(type, ind);
  }


  Future<void> fetchFaultReport() async {
    setStatus(nowWatchingType, DataStatus.loading);
    final result = await TeacherFaultReportDs.getFaultReportRecord(nowWatchingType);
    if(result.isSuccess){
      _records[nowWatchingType] = result.data!;
      setStatus(nowWatchingType, DataStatus.success);
    }else{
      ToastHelper.showErrorWithouDesc('${result.resCode}');
      setStatus(nowWatchingType, DataStatus.failure);
    }
  }

  Future<void> fetchTypeFaultReport(int type) async {
    setStatus(type, DataStatus.loading);
    final result = await TeacherFaultReportDs.getFaultReportRecord(type);
    if(result.isSuccess){
      _records[type] = result.data!;
      setStatus(type, DataStatus.success);
    }else{
      ToastHelper.showErrorWithouDesc('${result.resCode}');
      setStatus(type, DataStatus.failure);
    }
  }
}