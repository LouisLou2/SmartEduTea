import 'package:flutter/material.dart';
import 'package:smart_edu_tea/const/data_status.dart';
import 'package:smart_edu_tea/datasourse/imple/self_info_ds.dart';
import 'package:smart_edu_tea/handler/auth_handler.dart';

import '../entity/general/result.dart';
import '../entity/teacher.dart';

class UserProv extends ChangeNotifier{
  late String token;
  late Teacher teacher;
  late DataStatus _status = DataStatus.initial;
  DataStatus get status => _status;

  UserProv(){
    // after setToken
    token = AuthHandler.getToken();
  }

  void setStatus(DataStatus status){
    _status = status;
    notifyListeners();
  }

  Future<void> fetchTeaInfo() async {
    setStatus(DataStatus.loading);
    notifyListeners();
    Result<Teacher> result = await SelfInfoDs.getTeaInfo();
    if(result.isSuccess){
      teacher = result.data!;
      setStatus(DataStatus.success);
    } else {
      setStatus(DataStatus.failure);
    }
    notifyListeners();
  }
}