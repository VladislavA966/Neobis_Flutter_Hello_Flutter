import 'package:flutter/material.dart';

class TodoProvier extends ChangeNotifier {
  List todoList = [];
  void addPlans({required String controller}) {
    todoList.add(controller);
    print(todoList);
    notifyListeners();
  }
}
