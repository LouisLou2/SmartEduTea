import 'package:dio/dio.dart';
import 'package:smart_edu_tea/datasourse/manage/net_manager.dart';

import '../../const/rescode.dart';
import '../../entity/general/resp.dart';
import '../../entity/general/result.dart';
import '../../entity/teacher.dart';
import '../../helper/global_exception_handler.dart';
import '../manage/net_config.dart';
import '../manage/net_path_collector.dart';

class SelfInfoDs{
  static final Dio _baseDio8080 = NetworkManager.normalDio8080;

  static Future<Result<Teacher>> getTeaInfo() async {
    try{
      Response response = await _baseDio8080.post(
        NetworkPathCollector.selfInfo,
        options: NetworkConfig.json_json,
      );
      Resp resp = Resp.fromJson(response.data);
      if(ResCode.isOk(resp.code)) {
        return Result.success(Teacher.fromJson(resp.data));
      }
      return Result.abnormal(resp.code);
    } catch(e){
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }
}