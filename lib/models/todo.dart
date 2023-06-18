class Todo {
  Todo({
    required this.id,
    required this.title,
    required this.date,
    this.isDone = false,
  });

  final String id;
  String title;
  final DateTime date;
  final bool isDone;

  Todo copyWith({
    String? id,
    String? title,
    DateTime? date,
    bool? isDone,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  String toString() {
    return 'Todo(id: $id, title: $title, date: $date, isDone: $isDone)';
  }

  @override
  bool operator ==(covariant Todo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.date == date &&
        other.isDone == isDone;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ date.hashCode ^ isDone.hashCode;
  }
}
