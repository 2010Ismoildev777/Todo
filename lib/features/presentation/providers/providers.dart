import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/features/presentation/providers/todo_provider.dart';
import 'package:untitled1/features/todo/domain/entities/todo.dart';

final todoProvider = StateNotifierProvider<TodoProvider, List<Todo>>((ref) {
  return TodoProvider();
});