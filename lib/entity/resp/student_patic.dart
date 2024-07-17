import '../student_brief.dart';

class StudentPatic{
  int studentSum;
  List<StudentBrief> students;

  StudentPatic({required this.studentSum, required this.students});

  factory StudentPatic.fromJson(Map<String, dynamic> json){
    List<StudentBrief> students = [];
    for (var record in json['students']) {
      students.add(StudentBrief.fromJson(record));
    }
    return StudentPatic(
      studentSum: json['studentSum'],
      students: students,
    );
  }
}