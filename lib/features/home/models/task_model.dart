class TaskModel {
  String name;
  String details;
  DateTime date;
  String category;
  bool isDone;
  String id;

  TaskModel({
    required this.name,
    required this.details,
    required this.date,
    required this.category,
    this.id = '',
    this.isDone = false,
  });
}
