import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task.dart';
import 'package:todo/providers/task_provider.dart';
import 'package:velocity_x/velocity_x.dart';

class TaskAdder extends StatelessWidget {
  static const String id = '/task_adder';

  TaskAdder({Key? key}) : super(key: key);

  addTask(BuildContext context) {
    Task newTask = Task(title: _titleController.text, isCompleted: false);
    Provider.of<TaskProvider>(context, listen: false).addTask(newTask);
    Navigator.of(context).pop();
  }

  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 7,
        centerTitle: true,
        title: 'Add To-do'.text.bold.make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            'Adding a new task?'.text.size(18).semiBold.makeCentered(),
            22.heightBox,
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  border: OutlineInputBorder()),
            ),
            22.heightBox,
            CupertinoButton(
              child: 'Add New Task'.text.bold.make(),
              onPressed: () {
                addTask(context);
              },
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
