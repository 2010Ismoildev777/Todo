import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/features/todo/domain/entities/todo.dart';

class TodoProvider extends StateNotifier<List<Todo>> {
  TodoProvider() : super([]);

  void addTodo(String title) {
    final newTodo = Todo(id: DateTime.now().toString(), title: title);
    state = [...state, newTodo];
  }

  void toggleTodoStatus(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(isDone: !todo.isDone) else todo,
    ];
  }

  void removeTodo(int index){
    state = [...state]..removeAt(index);
  }
}
