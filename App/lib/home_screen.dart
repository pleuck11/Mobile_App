import 'package:flutter/material.dart';
import 'package:mobileapp/add.todo_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> todoItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Myapp'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todoItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todoItems[index]),
                  subtitle: Text("subtitle"),
                  leading: Checkbox(
                    value: true,
                    onChanged: (bool? value) {
                      // handle the change
                      setState(() {});
                    },
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        todoItems.removeAt(index);
                      });
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            onPressed: () async {
              final result = await Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => AddTodoScreen()));
              if (result != null) {
                setState(() {
                  todoItems.add(result);
                });
              }
            },
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}
