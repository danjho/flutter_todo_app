class Task {
  Task({
    this.id = '',
    this.title = '',
    this.done = false,
    this.date,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        done: json['done'] ?? false,
        date: DateTime.tryParse(json['date'] ?? ''),
      );

  String id;
  String title;
  bool done;
  DateTime? date;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'done': done,
        'date': date?.toIso8601String(),
      };

  static List<Task> fromList(List list) {
    return List<Task>.from(list.map((e) => Task.fromJson(e)));
  }
}
