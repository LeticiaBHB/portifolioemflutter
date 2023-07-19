import 'package:flutter/material.dart';
import 'package:prototipo/seventh/pages/todo_list_page.dart';

class SeventhRoute extends StatefulWidget {
  @override
  _SeventhRouteState createState() => _SeventhRouteState();
}
class _SeventhRouteState extends State<SeventhRoute> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Organizador de tarefas',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Organizador de tarefas',textAlign: TextAlign.center),
        ),
        body: TodoListPage(),
      ),
    );
  }
}
