import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todo_list_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    TextEditingController editingController = TextEditingController();
    final vm = context.watch<TodoProvier>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Добавить заметку'),
              actions: [
                Center(
                  child: TextButton(
                    onPressed: () {
                      vm.addPlans(controller: controller.text);
                      Navigator.pop(context);
                    },
                    child: const Text('Добавить'),
                  ),
                ),
              ],
              content: SizedBox(
                height: 60,
                width: 300,
                child: Column(
                  children: [
                    TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'Заметка',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Список дел'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: vm.todoList.length,
        itemBuilder: (context, index) {
          return Slidable(
            key: ValueKey(vm.todoList[index]),
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {
                vm.removePlan(index);
              }),
              children: [
                SlidableAction(
                  onPressed: (BuildContext context) {
                    vm.removePlan(index);
                  },
                  backgroundColor: const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
                SlidableAction(
                  onPressed: (BuildContext context) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Изменить заметку'),
                        actions: [
                          Center(
                            child: TextButton(
                              onPressed: () {
                                vm.changePlan(editingController.text, index);
                                Navigator.pop(context);
                              },
                              child: const Text('Изменить'),
                            ),
                          ),
                        ],
                        content: SizedBox(
                          height: 60,
                          width: 300,
                          child: Column(
                            children: [
                              TextField(
                                controller: editingController,
                                decoration: InputDecoration(
                                  hintText: 'Изменить заметку',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  backgroundColor: const Color(0xFF21B7CA),
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Edit',
                ),
              ],
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.amber,
              ),
              height: 70,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    vm.todoList[index].toString(),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
