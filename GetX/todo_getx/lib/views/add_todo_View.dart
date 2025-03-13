import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';

class AddTodoView extends StatelessWidget {
  AddTodoView({super.key});

  final TodoController todoController = Get.put(TodoController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add To-do"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "List Name",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Item name",
              ),
              style: const TextStyle(color: Colors.black), // เพิ่ม style ที่นี่
            ),
            const SizedBox(height: 10),
            const Text(
              "Details",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: detailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Fill in details",
              ),
              style: const TextStyle(color: Colors.black), // เพิ่ม style ที่นี่
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  todoController.addTodo(
                    titleController.text,
                    detailController.text,
                  );
                  Get.back();
                },
                child: const Text("Record"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
