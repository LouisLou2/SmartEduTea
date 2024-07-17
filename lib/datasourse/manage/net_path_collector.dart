import '../../const/config.dart';

class NetworkPathCollector {
  static const String host8080 = Configs.BaseUrl8080;
  /*------------------分类-------------------*/
  static const faultReportRecord = "/faultReportRecord";// not ok
  static const classroomApplyRecord = "/ts/Classroom/getReservation"; // url ok
  static const couseTable= "/ts/TeacherInfo/courseTable";// url ok
  static const timePlace = "/tr/files/basicInfo";// url ok
  static const courseList = "/tr/teacherCourse/courseInfo";// url ok

  static const courseStudents = "/uau/studentCourses/getCourseStudents";
  static const uploadScores = "/ts/TeacherInfo/uploadScores";

  static const selfInfo = "/ts/TeacherInfo/getTeacherInfo";
  /*------------------分类-------------------*/
  static String getLoginPath() => "www.google.com";
}