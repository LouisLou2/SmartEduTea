import 'package:dio/dio.dart';
import 'package:smart_edu_tea/const/rescode.dart';
import 'package:smart_edu_tea/datasourse/manage/net_config.dart';
import 'package:smart_edu_tea/datasourse/manage/net_path_collector.dart';
import 'package:smart_edu_tea/entity/course_brief.dart';
import 'package:smart_edu_tea/entity/course_task.dart';
import 'package:smart_edu_tea/helper/global_exception_handler.dart';
import 'package:smart_edu_tea/presentation/page/course_detail.dart';

import '../../entity/course_detail.dart';
import '../../entity/general/resp.dart';
import '../../entity/general/result.dart';
import '../manage/net_manager.dart';

class TeacherCourseDs{
  static final _baseDao8080 = NetworkManager.normalDio8080;

  static Future<Result<List<CourseTask>> > getCourseTable(int year, bool termPart, int week) async {
    try{
      Response response = await _baseDao8080.post(
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
      Response response = await _baseDao8080.post(
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

  static Future<Result<CourseDetail>> getCourseDetail(int courseInstId) async {
    try{
      Response response = await _baseDao8080.post(
        NetworkPathCollector.courseDetail,
        data: {
          'courseInstId': courseInstId,
        },
        options: NetworkConfig.json_json,
      );
      Resp res = Resp.fromJson(response.data);
      if(ResCode.isOk(res.code)){
        CourseDetail courseDetail = CourseDetail.fromJson(res.data);
        return Result.success(courseDetail);
      }
      return Result.abnormal(res.code);
    }catch(e){
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }

}