import 'package:dio/dio.dart';
import 'package:smart_edu_tea/entity/resp/student_patic.dart';
import '../../const/rescode.dart';
import '../../entity/score.dart';
import '../../entity/general/resp.dart';
import '../../entity/general/result.dart';
import '../../helper/global_exception_handler.dart';
import '../manage/net_config.dart';
import '../manage/net_manager.dart';
import '../manage/net_path_collector.dart';

class CourseStudentsDs {
  static final _baseDio8080 = NetworkManager.normalDio8080;

  static Future<Result<StudentPatic>> getCourseStudents(int courseInstId, int offset, int num) async {
    try {
      Response response = await _baseDio8080.post(
        NetworkPathCollector.courseStudents, // 确保这个路径在您的NetPathCollector中定义
        data: {
          'courseInstId': courseInstId,
          'offset': offset,
          'num': num,
        },
        options: NetworkConfig.json_json,
      );
      Resp res = Resp.fromJson(response.data);
      if (ResCode.isOk(res.code)) {
        StudentPatic sp = StudentPatic.fromJson(res.data);
        return Result.success(sp);
      }
      return Result.abnormal(res.code);
    } catch (e) {
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }

  static Future<Result<void>> uploadScores(int courseInstId, List<Score> stuScores) async {
    try {
      List<Map<String, dynamic>> scoresJson = stuScores.map((score) => score.toJson()).toList();

      Response response = await _baseDio8080.post(
        NetworkPathCollector.uploadScores, // 确保这个路径在您的NetPathCollector中定义
        data: {
          'courseInstId': courseInstId,
          'stuScores': scoresJson,
        },
        options: NetworkConfig.json_json,
      );
      Resp res = Resp.fromJson(response.data);
      if (ResCode.isOk(res.code)) {
        return Result.success(null);
      }
      return Result.abnormal(res.code);
    } catch (e) {
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }
}