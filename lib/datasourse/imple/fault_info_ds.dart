import 'package:dio/dio.dart';
import 'package:smart_edu_tea/const/rescode.dart';
import 'package:smart_edu_tea/datasourse/manage/net_config.dart';
import 'package:smart_edu_tea/datasourse/manage/net_path_collector.dart';
import 'package:smart_edu_tea/entity/fault_report_record.dart';
import 'package:smart_edu_tea/helper/global_exception_handler.dart';

import '../../entity/general/resp.dart';
import '../../entity/general/result.dart';
import '../manage/net_manager.dart';

class TeacherFaultReportDs {
  static final _baseDao = NetworkManager.normalDio8080;

  static Future<Result<List<FaultReportRecord>>> getFaultReportRecord(int status) async {
    status=1;
    try {
      Response response = await _baseDao.post(
        NetworkPathCollector.faultReportRecord,
        data: {
          'status': status,
        },
        options: NetworkConfig.json_json,
      );
      Resp res = Resp.fromJson(response.data);
      if (ResCode.isOk(res.code)) {
        final records = res.data['records'] as List;
        List<FaultReportRecord> list = records.map((record) => FaultReportRecord.fromJson(record)).toList();
        return Result.success(list);
      }
      return Result.abnormal(res.code);
    } catch (e) {
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }
}