class CreateTaskDto {
  CreateTaskDto({
    required this.title,
    required this.date,
    required this.category,
  });

  factory CreateTaskDto.empty() => CreateTaskDto(
        title: '',
        date: DateTime.now(),
        category: 0,
      );

  String title;
  DateTime date;
  int category;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date.toIso8601String(),
      'category': category,
    };
  }
}
