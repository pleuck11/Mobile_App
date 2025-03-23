import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';
import 'package:todo_getx/models/todo_model.dart';

// ignore: must_be_immutable
class AddTodoView extends StatefulWidget {
  AddTodoView({super.key, this.todo});
  TodoModel? todo;

  @override
  State<AddTodoView> createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  final TodoController todoController = Get.put(TodoController());

  final TextEditingController titleController = TextEditingController();

  final TextEditingController detailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {
      titleController.text = widget.todo!.title;
      detailController.text = widget.todo!.subtitle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.todo != null ? "modify" : "Add Todo"),
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
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (detailController.text.isEmpty) return;
                  if (widget.todo != null) {
                    widget.todo!.title = titleController.text;
                    widget.todo!.subtitle = detailController.text;
                    print(widget.todo!.toJson());
                    todoController.updateTodo(widget.todo!);
                  } else {
                    todoController.addTodo(
                      titleController.text,
                      detailController.text,
                    );
                  }
                  // todoController.addTodo(
                  //   titleController.text,
                  //   detailController.text,
                  // );
                  Get.back();
                  Get.snackbar("Success", "Recorded successfully");
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
