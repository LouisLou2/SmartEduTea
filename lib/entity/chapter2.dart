import 'package:smart_edu_tea/entity/teaching_material.dart';

class Chapter2 {
  int chapterId;
  String chapterTitle;
  List<TeachingMaterial> materials;

  Chapter2({required this.chapterId, required this.chapterTitle, required this.materials});

  factory Chapter2.fromJson(Map<String, dynamic> json){
    return Chapter2(
      chapterId: json['chapterId'],
      chapterTitle: json['chapterTitle'],
      materials: (json['materials'] as List).map((e) => TeachingMaterial.fromJson(e)).toList()
    );
  }
}