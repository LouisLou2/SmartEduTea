import 'package:dio/dio.dart';
import 'package:smart_edu_tea/const/rescode.dart';
import 'package:smart_edu_tea/datasourse/manage/net_config.dart';
import 'package:smart_edu_tea/datasourse/manage/net_path_collector.dart';
import 'package:smart_edu_tea/entity/course_brief.dart';
import 'package:smart_edu_tea/entity/course_task.dart';
import 'package:smart_edu_tea/entity/fault_report_record.dart';
import 'package:smart_edu_tea/entity/resp/classroom_apply_record.dart';
import 'package:smart_edu_tea/helper/global_exception_handler.dart';

import '../../entity/general/resp.dart';
import '../../entity/general/result.dart';
import '../manage/net_manager.dart';

class TeacherCourseDs{
  static final _baseDao = NetworkManager.normalDio;

  static Future<Result<ClassroomApplyRecordResp>> getClassroomApplyRecord(int offset, int num) async {
    try{
      Response response = await _baseDao.get(
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

  static Future<Result<List<CourseTask>> > getCourseTable(int year, bool termPart, int week) async {
    try{
      Response response = await _baseDao.get(
        NetworkPathCollector.couseTable,
        data: {
          'year': year,
          'termPart': termPart,
          'week': week,
        },
        options: NetworkConfig.json_json,
      );
      Resp res = Resp.fromJson(response.data);
      if(ResCode.isOk(res.code)){
        final records = res.data['course_tasks'];
        List<CourseTask> list = [];
        for(var record in records){
          list.add(CourseTask.fromJson(record));
        }
        return Result.success(list);
      }
      return Result.abnormal(res.code);
    }catch(e){
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }

  static Future<Result<List<CourseBrief>>> getCourseBriefList(int year, bool termPart) async {
    try{
      Response response = await _baseDao.get(
        NetworkPathCollector.courseList,
        data: {
          'year': year,
          'termPart': termPart,
        },
        options: NetworkConfig.json_json,
      );
      Resp res = Resp.fromJson(response.data);
      if(ResCode.isOk(res.code)){
        final records = res.data['courses'];
        List<CourseBrief> list = [];
        for(var record in records){
          list.add(CourseBrief.fromJson(record));
        }
        return Result.success(list);
      }
      return Result.abnormal(res.code);
    }catch(e){
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }

}