class Event{
  final int id;
  final String title;
  final String shortDesc;
  final DateTime time;
  final String type;

  Event({
    required this.id,
    required this.title,
    required this.shortDesc,
    required this.time,
    required this.type,
  });

  factory Event.fromJson(Map<String, dynamic> json){
    return Event(
      id: json['id'],
      title: json['title'],
      shortDesc: json['short_desc'],
      time: DateTime.parse(json['time']),
      type: json['type'],
    );
  }
}