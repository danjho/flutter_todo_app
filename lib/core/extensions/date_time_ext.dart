extension DeteTimeExt on DateTime {
  bool isToday() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return DateTime(year, month, day) == today;
  }

  bool isTomorrow() {
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    return DateTime(year, month, day) == tomorrow;
  }

  String toStringValue() {
    if (isToday()) {
      return 'Today';
    }

    if (isTomorrow()) {
      return 'Tomorrow';
    }

    return toString().split(' ')[0];
  }
}
