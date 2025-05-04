import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/features/presentation/providers/providers.dart';

Future<dynamic> showAddDialog(BuildContext context, WidgetRef ref) {
  TextEditingController controller = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.yellow[100],
        title: Text('Add New Todo'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            hintText: 'Add Todo',
            hintStyle: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancel',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              ref.read(todoProvider.notifier).addTodo(controller.text);
              controller.clear();
              Navigator.pop(context);
            },
            child: Text(
              'Add',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ),
        ],
      );
    },
  );
}
