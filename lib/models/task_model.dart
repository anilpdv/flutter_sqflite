import 'dart:convert';

class Task {
  int id;
  String title;
  DateTime date;
  String priority;
  int status;

  Task({
    this.id,
    this.title,
    this.date,
    this.priority,
    this.status,
  });
  Task.withId({this.id, this.title, this.date, this.priority, this.status});

  Task copyWith({
    int id,
    String title,
    DateTime date,
    String priority,
    int status,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      priority: priority ?? this.priority,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date.toIso8601String(),
      'priority': priority,
      'status': status.toString(),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Task(
      id: map['id'],
      title: map['title'],
      date: DateTime.parse(map['date']),
      priority: map['priority'],
      status: int.parse(map['status']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Task(id: $id, title: $title, date: $date, priority: $priority, status: $status)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Task &&
        o.id == id &&
        o.title == title &&
        o.date == date &&
        o.priority == priority &&
        o.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        date.hashCode ^
        priority.hashCode ^
        status.hashCode;
  }
}
