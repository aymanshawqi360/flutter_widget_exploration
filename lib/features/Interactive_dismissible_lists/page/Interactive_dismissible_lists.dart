import 'package:flutter/material.dart';
import 'package:flutter_widget_exploration/features/Interactive_dismissible_lists/constants/task_list.dart';

class InteractiveDismissibleLists extends StatefulWidget {
  const InteractiveDismissibleLists({super.key});

  @override
  State<InteractiveDismissibleLists> createState() =>
      _InteractiveDismissibleListsState();
}

class _InteractiveDismissibleListsState
    extends State<InteractiveDismissibleLists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.blue),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ReorderableListView(
          children: List.generate(
            TaskList.tasks.length,
            (int index) => Dismissible(
              confirmDismiss: (direction) => showDialog(
                context: context,
                builder: (context) {
                  final number = TaskList.tasks[index];
                  return AlertDialog(
                    title: Text("Delete"),
                    content: Text(
                      "Are you sure you want to delete ${TaskList.tasks[index].taskName}?",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("No"),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Task deleted'),
                                action: SnackBarAction(
                                  label: 'UNDO',
                                  onPressed: () {
                                    setState(() {
                                      TaskList.tasks.insert(index, number);
                                    });
                                  },
                                ),
                              ),
                            );

                            TaskList.tasks.remove(TaskList.tasks[index]);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text("Yes"),
                      ),
                    ],
                  );
                },
              ),

              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.delete, color: Colors.white),
              ),
              key: ValueKey(TaskList.tasks[index]),
              child: Card(
                child: ListTile(
                  trailing: Checkbox(
                    onChanged: (value) {
                      setState(() {
                        TaskList.tasks[index].isOnTap = value;
                      });
                    },
                    value: TaskList.tasks[index].isOnTap,
                  ),
                  leading: Icon(Icons.drag_handle),
                  title: Text(
                    TaskList.tasks[index].taskName.toString(),
                    style: TextStyle(
                      decoration: TaskList.tasks[index].isOnTap ?? false
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final item = TaskList.tasks.removeAt(oldIndex);

              TaskList.tasks.insert(newIndex, item);
            });
          },
        ),
      ),
    );
  }
}
