import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/auth_controller.dart';
import 'package:todo_getx/controllers/todo_controller.dart';
import 'package:todo_getx/models/todo_model.dart';
import 'package:todo_getx/views/add_todo_View.dart';
import 'package:todo_getx/views/login_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final AuthController authController = Get.put(AuthController());
  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    todoController.fetchTodos();
    print('fetchTodos');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Myapp'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Obx(
        () => Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: todoController.todoList.length,
                  itemBuilder: (context, index) {
                    TodoModel todo = todoController.todoList[index];
                    return ListTile(
                      title: Text(todo.title),
                      subtitle: Text(todo.subtitle),
                      leading: Checkbox(
                        value: todo.isDone,
                        onChanged: (bool? newValue) {
                          todoController.toggleDone(index);
                        },
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          todoController.deleteTodo(todo.docid ?? '');
                        },
                        icon: Icon(Icons.delete),
                      ),
                      onTap: () {
                        Get.to(AddTodoView(todo: todo));
                      },
                    );
                  },
                ),
              ),
              if (todoController.todoList.any((todo) => todo.isDone))
                ElevatedButton(
                  onPressed: () {
                    todoController.delete_compled();
                  },
                  child: Icon(Icons.delete),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Get.to(() => AddTodoView());
              },
              child: Icon(Icons.add),
            ),
            SizedBox(height: 20),
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                if (authController.user.value?.uid.isNotEmpty ?? false) {
                  todoController.clear();
                  authController.signOut();
                } else {
                  Get.off(LoginView());
                }
              },
              child: Icon(
                authController.user.value?.uid == null
                    ? Icons.account_circle
                    : Icons.logout_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
