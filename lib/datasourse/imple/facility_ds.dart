import 'package:dio/dio.dart';
import 'package:smart_edu_tea/entity/classroom_brief.dart';
import 'package:smart_edu_tea/entity/req/reserve_classroom.dart';

import '../../const/rescode.dart';
import '../../entity/fault_report_record.dart';
import '../../entity/general/resp.dart';
import '../../entity/general/result.dart';
import '../../entity/resp/classroom_apply_record.dart';
import '../../helper/global_exception_handler.dart';
import '../manage/net_config.dart';
import '../manage/net_manager.dart';
import '../manage/net_path_collector.dart';

class FacilityDs{
  static final _baseDao = NetworkManager.normalDio8080;

  static Future<Result<List<ClassroomBrief>>> getClassroomList(int campusId, String building) async {
    try {
      Response response = await _baseDao.get(
        NetworkPathCollector.classroomList,
        data: {
          'campusId': campusId,
          'building': building,
        },
        options: NetworkConfig.json_json,
      );
      Resp res = Resp.fromJson(response.data);
      if (ResCode.isOk(res.code)) {
        final records = res.data['ClassroomVO'] as List;
        List<ClassroomBrief> list = records.map((record) => ClassroomBrief.fromJson(record)).toList();
        return Result.success(list);
      }
      return Result.abnormal(res.code);
    } catch (e) {
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }

  static Future<Result<bool>> reserveClassroom(ReserveClassroomReq req) async{
    try {
      Response response = await _baseDao.post(
        NetworkPathCollector.reserveClassroom,
        data: req.toJson(),
        options: NetworkConfig.json_json,
      );
      Resp res = Resp.fromJson(response.data);
      if (ResCode.isOk(res.code)) {
        return Result.success(true);
      }
      return Result.abnormal(res.code);
    } catch (e) {
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }

  static Future<Result<ClassroomApplyRecordResp>> getClassroomApplyRecord(int offset, int num) async {
    try{
      Response response = await _baseDao.post(
        NetworkPathCollector.classroomApplyRecord,
        data: {
          'offset': offset,
          'num': num,
        },
        options: NetworkConfig.json_json,
      );
      Resp res = Resp.fromJson(response.data);
      if(ResCode.isOk(res.code)){
        return Result.success(ClassroomApplyRecordResp.fromJson(res.data));
      }
      return Result.abnormal(res.code);
    }catch(e){
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }

  static Future<Result<List<FaultReportRecord>>> getFaultReportRecord(int status) async {
    try{
      Response response = await _baseDao.get(
        NetworkPathCollector.faultReportRecord,
        data: {
          'status': status,
        },
        options: NetworkConfig.json_json,
      );
      Resp res = Resp.fromJson(response.data);
      if(ResCode.isOk(res.code)){
        final records = res.data['records'];
        List<FaultReportRecord> list = [];
        for(var record in records){
          list.add(FaultReportRecord.fromJson(record));
        }
        return Result.success(list);
      }
      return Result.abnormal(res.code);
    }catch(e){
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }
}