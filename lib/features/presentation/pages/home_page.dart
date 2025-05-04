import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/features/presentation/providers/providers.dart';
import 'package:untitled1/features/presentation/widgets/show_dialog.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);
    final readTodo = ref.read(todoProvider.notifier);
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        elevation: 2,
        centerTitle: true,
        title: Text('T O  D O', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(todos[index].id),
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(14),
                      topRight: Radius.circular(14),
                    ),
                  ),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (direction) {
                  readTodo.removeTodo(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: ListTile(
                    title: Text(
                      todos[index].title,
                      style: TextStyle(
                        decoration:
                            todos[index].isDone
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                      ),
                      overflow:
                          todos[index].isDone ? null : TextOverflow.ellipsis,
                    ),
                    leading: Checkbox(
                      value: todos[index].isDone,
                      onChanged: (_) {
                        readTodo.toggleTodoStatus(todos[index].id);
                      },
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 20),
            itemCount: todos.length,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: Colors.yellow,
        onPressed: () {
          showAddDialog(context, ref);
        },
        child: Icon(Icons.add, size: 25, color: Colors.black),
      ),
    );
  }
}
