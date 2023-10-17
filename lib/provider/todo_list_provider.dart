import 'package:flutter/material.dart';

class TodoProvier extends ChangeNotifier {
  List todoList = [];

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
