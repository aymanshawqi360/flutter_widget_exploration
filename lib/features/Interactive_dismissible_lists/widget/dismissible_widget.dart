import 'package:flutter/material.dart';
import 'package:flutter_widget_exploration/features/Interactive_dismissible_lists/constants/task_list.dart';

class DismissibleWidget extends StatelessWidget {
  final int index;
  const DismissibleWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      confirmDismiss: (direction) => showDialog(
        context: context,
        builder: (context) {
          final dd = TaskList.tasks[index];
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
                  // setState(() {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Task deleted'),
                      action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {
                          // setState(() {
                          // });
                          TaskList.tasks.insert(index, dd);
                        },
                      ),
                      duration: Duration(seconds: 3),
                    ),
                  );

                  TaskList.tasks.remove(TaskList.tasks[index]);
                  // });
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
          leading: Icon(Icons.drag_handle),
          title: Text(TaskList.tasks[index].taskName.toString()),
        ),
      ),
    );
  }
}
