import '../../const/rescode.dart';

class Result<T>{
  int resCode;
  T? data;
  Result(this.resCode, {this.data});
  Result.abnormal(this.resCode):data=null;
  Result.success(this.data):resCode=ResCode.SUCCESS;

  bool get isSuccess => resCode==ResCode.SUCCESS;
}