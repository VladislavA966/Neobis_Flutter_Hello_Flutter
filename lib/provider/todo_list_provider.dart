import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  List<String> todoList = [];

  void addPlans({required String controller}) {
    todoList.add(controller);

    notifyListeners();
  }

  removePlan(int index) {
    todoList.removeAt(index);
    notifyListeners();
  }

  void changePlan(String newPlan, int index) {
    todoList[index] = newPlan;

    notifyListeners();
  }
}
