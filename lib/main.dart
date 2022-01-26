import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/todo_list.dart';
import 'package:todo/providers/task_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const TodoList(),
        title: 'To-do App',
        theme: ThemeData.dark(),
      ),
    );
  }
}
