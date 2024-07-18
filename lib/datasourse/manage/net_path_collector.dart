import '../../const/config.dart';

class NetworkPathCollector {
  static const String host8080 = Configs.BaseUrl8080;
  /*------------------分类-------------------*/
  static const faultReportRecord = "/ac/api/fault_report";// not ok
  static const faultReport = "/ac/api/new_fault_report";// not ok
  static const classroomApplyRecord = "/ts/Classroom/getReservation"; // url ok
  static const couseTable= "/ts/TeacherInfo/courseTable";// url ok
  static const timePlace = "/tr/files/basicInfo";// url ok
  static const courseList = "/tr/teacherCourses/coursesInfo";// url ok
  static const courseDetail = "/tr/files/courseDetailInfo";// url unknown

  static const courseStudents = "/uau/studentCourses/getCourseStudent";
  static const uploadScores = "/ts/TeacherInfo/uploadGrades";

  static const selfInfo = "/ts/TeacherInfo/teacherDetails";

  static const classroomList = "/ts/Classroom/getClassroom";
  static const reserveClassroom = "/ts/Classroom/reserveClassroom";
  /*------------------分类-------------------*/
  static String getLoginPath() => "www.google.com";
}