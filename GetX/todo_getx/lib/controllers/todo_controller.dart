import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_getx/models/todo_model.dart';

class TodoController extends GetxController {
  var todoList = <TodoModel>[].obs;

  final GetStorage _box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    var todos = _box.read("todos");
    if (todos != null) {
      todoList =
          List<TodoModel>.from(
            (todos as List).map((item) => TodoModel.fromJson(item)),
          ).obs;
    }
  }

  void addTodo(String title, String subtitle) {
    todoList.add(TodoModel(title, subtitle, false));
    _box.write('todos', todoList.toJson());
  }

  void toggleDone(int index) {
    todoList[index].isDone = !todoList[index].isDone;
    todoList.refresh();
  }

  void delete(int index) {
    todoList.removeAt(index);
  }

  // ignore: non_constant_identifier_names
  void delete_compled() {
    todoList.removeWhere((todo) => todo.isDone);
  }
}
