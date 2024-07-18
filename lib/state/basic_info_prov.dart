import 'package:flutter/cupertino.dart';
import 'package:smart_edu_tea/entity/resp/place_time.dart';
import 'package:smart_edu_tea/entity/general/result.dart';

import '../const/config.dart';
import '../const/data_status.dart';
import '../data/basic_data.dart';
import '../datasourse/imple/basic_info_ds.dart';

class BasicDataProv extends ChangeNotifier {
  DataStatus _status = DataStatus.initial;

  DataStatus get status => _status;

  void setStatus(DataStatus status) {
    _status = status;
    notifyListeners();
  }

  Future<void> equipBasics() async {
    setStatus(DataStatus.loading);
    Result<PlaceTime> pt = await BasicInfoDs.getTimePlace();
    for (int i = 0; i < Configs.maxRetry; ++i) {
      if (pt.isSuccess) {
        BasicData.init(
          campuses1: pt.data!.campusList,
          nowWeek1: pt.data!.nowWeek,
          nowTermPart1: pt.data!.nowTermPart,
          earliestTermYear1: pt.data!.earliestTermYear,
          earliestTermPart1: pt.data!.earliestTermPart,
          schools1: pt.data!.schoolMajorList,
        );
        setStatus(DataStatus.success);
        return;
      }
    }
    setStatus(DataStatus.failure);
  }
}