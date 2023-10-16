import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todo_list_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
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
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.amber,
              ),
              height: 50,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  vm.todoList[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
