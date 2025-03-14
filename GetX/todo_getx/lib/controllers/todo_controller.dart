import 'package:get/get.dart';
import 'package:todo_getx/controllers/auth_controller.dart';
import 'package:todo_getx/models/todo_model.dart';
import 'package:todo_getx/services/storage_services.dart';

class TodoController extends GetxController {
  var todoList = <TodoModel>[].obs;
  StorageServices storageServices = StorageServices();
  AuthController authController = Get.put(AuthController());

  @override
  void onInit() {
    super.onInit();

    fetchTodos();
  }

  Future<void> addTodo(String title, String subtitle) async {
    TodoModel todo = TodoModel(
      title,
      subtitle,
      false,
      uid: authController.user.value?.uid,
    );
    String docId = await storageServices.write('todos', todo.toJson());
    todo.docid = docId;
    todoList.add(todo);
  }

  Future<void> updateTodo(TodoModel todo) async {
    todoList.where((todo) => todo.docid == todo.docid).title;
    todoList.where((todo) => todo.docid == todo.docid).subtitle;
    todoList.refresh();
    await storageServices.update('todos',todo.docid ?? '', todo.toJson());
  }

  void toggleDone(int index) {
    todoList[index].isDone = !todoList[index].isDone;
    todoList.refresh();
    storageServices.update('todos', todoList[index].docid ?? '', {
      'isDone': todoList[index].isDone,
    });
  }

  void deleteTodo(String docId) {
    todoList.removeWhere((todo) => todo.docid == docId);
    storageServices.delete("todos", docId);
  }

  // ignore: non_constant_identifier_names
  void delete_compled() {
    todoList.removeWhere((todo) => todo.isDone == true);
    storageServices.deleteAll("todos");
  }

  Future<void> fetchTodos() async {
    print('fetchTodos${authController.user.value?.uid}');
    var todos = await storageServices.read(
      'todos',
      authController.user.value?.uid ?? '',
    );
    if (todos != null) {
      todoList.value =
          List.from(
            todos,
          ).map((e) => TodoModel.fromJson(e as Map<String, dynamic>)).toList();
    }
    todoList.refresh();
  }

  void clear() {
    todoList.clear();
  }
}

extension on Iterable<TodoModel> {
  get subtitle => null;
  get title => null;
}
