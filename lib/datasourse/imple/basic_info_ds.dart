import 'package:dio/dio.dart';
import 'package:smart_edu_tea/datasourse/manage/net_config.dart';
import 'package:smart_edu_tea/datasourse/manage/net_manager.dart';
import 'package:smart_edu_tea/entity/resp/place_time.dart';

import '../../const/rescode.dart';
import '../../entity/general/resp.dart';
import '../../entity/general/result.dart';
import '../../helper/global_exception_handler.dart';
import '../manage/net_path_collector.dart';

class BasicInfoDs{
  static final _baseDio8080 = NetworkManager.normalDio8080;

  static Future<Result<PlaceTime>> getTimePlace() async {
    try{
      Response response = await _baseDio8080.get(
        NetworkPathCollector.timePlace,
        options: NetworkConfig.json_json,
      );
      Resp res = Resp.fromJson(response.data);
      if(ResCode.isOk(res.code)){
        return Result.success(PlaceTime.fromJson(res.data));
      }
      return Result.abnormal(res.code);
    }catch(e){
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }
}