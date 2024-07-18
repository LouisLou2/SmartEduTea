
enum DataStatus{
  initial,
  loading,
  success,
  failure,
}

bool urgingStatus(DataStatus status){
  return status == DataStatus.initial || status == DataStatus.failure;
}