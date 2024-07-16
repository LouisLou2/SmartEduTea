class ApplicationResult{
  static const int PENDING = 1;
  static const int APPROVED = 2;
  static const int CANCELLED = 3;
  static List<int> applicationResult = [PENDING,APPROVED,CANCELLED];
  // 1: 待处理 2：通过 3：取消
  static List<String> applicationResultName = ['Pending','Approved','Cancelled'];
}