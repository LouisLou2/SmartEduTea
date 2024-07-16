import 'package:dio/dio.dart';

import '../const/rescode.dart';
import '../entity/general/result.dart';
class GlobalExceptionHelper{

  static Result<T> getErrorResInfo<T>(Object e){
    // network part
    if(e.runtimeType==DioException){
      return Result(ResCode.FAIL);
    }
    // debug part
    return Result(ResCode.DEBUG_ERROR);
  }

  // network part: timeout
  static bool isTimeOutException(DioException e){
    return e.type==DioExceptionType.sendTimeout||e.type==DioExceptionType.receiveTimeout||e.type==DioExceptionType.connectionTimeout;
  }
}