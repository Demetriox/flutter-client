import 'package:flutter/material.dart';
import 'package:sprint/gui/widgets/global/apppage.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return const AppPage(content: Text("Tasks"));
  }
}
