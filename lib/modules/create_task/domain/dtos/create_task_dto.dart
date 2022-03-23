class CreateTaskDto {
  CreateTaskDto({
    required this.title,
    required this.date,
    required this.category,
  });

  String title;
  DateTime date;
  String category;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date.millisecondsSinceEpoch,
      'category': category,
    };
  }
}
