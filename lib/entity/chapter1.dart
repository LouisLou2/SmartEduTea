import 'chapter2.dart';

class Chapter1 {
  final int id;
  final String title;
  final List<Chapter2> chapter2s;

  Chapter1({required this.id, required this.title, required this.chapter2s});

  factory Chapter1.fromJson(Map<String, dynamic> json){
    return Chapter1(
      id: json['id'],
      title: json['title'],
      chapter2s: (json['chapter2s'] as List).map((e) => Chapter2.fromJson(e)).toList()
    );
  }
}