import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/task_adder.dart';
import 'package:todo/providers/task_provider.dart';
import 'package:velocity_x/velocity_x.dart';

class TodoList extends StatelessWidget {
  static const String id = '/todo_list';

  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 7,
        title: 'To-do List'.text.bold.makeCentered(),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) => Column(
          children: [
            Expanded(
              child: (taskProvider.tasks.isEmpty)
                  ? Center(
                      child: LottieBuilder.asset('assets/animation/sad.json'),
                    )
                  : ListView.builder(
                      itemCount: taskProvider.tasks.length,
                      itemBuilder: (context, index) => Dismissible(
                            key: UniqueKey(),
                            onDismissed: (direction) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Task Dismissed!')));
                            },
                            child: Card(
                                child: ListTile(
                              title: Text(
                                taskProvider.tasks[index].title,
                              ),
                              subtitle: taskProvider.tasks[index].isCompleted
                                  ? 'Completed'.text.make()
                                  : const Text('Incomplete'),
                            )),
                          )),
            ),
            CupertinoButton(
              child: 'Add Task'.text.bold.make(),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TaskAdder()));
              },
              color: Theme.of(context).primaryColor,
            )
          ],
        ).p(22),
      ),
    );
  }
}
