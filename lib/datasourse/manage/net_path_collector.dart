import '../../const/config.dart';

class NetworkPathCollector {
  static const String host = Configs.BaseUrl;// server host
  static const String restfulAPI = "/teacherInfo"; // restful api
  static const String userApi = "$host$restfulAPI";// dio的baseUrl，客户端一切请求都是基于这个baseUrl的
  /*------------------分类-------------------*/
  static const faultReportRecord = "/faultReportRecord";
  static const classroomApplyRecord = "/classroomApplyRecord";
  static const couseTable= "/courseTable";
}