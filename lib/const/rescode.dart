class ResCode{
  static const int SUCCESS=200;
  static const int FAIL=500;
  static const int DEBUG_ERROR=1000;

  static isOk(int resCode){
    return resCode==SUCCESS;
  }
}