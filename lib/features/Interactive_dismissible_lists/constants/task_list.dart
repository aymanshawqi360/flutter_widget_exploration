import 'package:flutter_widget_exploration/features/Interactive_dismissible_lists/model/task_model.dart';

class TaskList extends TaskModel {
  TaskList({required super.taskName, required super.isOnTap});

  static List<TaskList> tasks = [
    TaskList(taskName: 'Finish Flutter project', isOnTap: false),
    TaskList(taskName: 'Go shopping', isOnTap: false),
    TaskList(taskName: 'Go shopping', isOnTap: false),
    TaskList(taskName: 'Reply to emails', isOnTap: false),
    TaskList(taskName: 'Do workout', isOnTap: false),
    TaskList(taskName: 'Review university assignments', isOnTap: false),
    TaskList(taskName: 'Read a chapter of a book', isOnTap: false),
    TaskList(taskName: 'Call the family', isOnTap: false),
  ];
}
