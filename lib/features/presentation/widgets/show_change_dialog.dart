import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/features/presentation/providers/providers.dart';

Future<dynamic> showChangeDialog(BuildContext context, WidgetRef ref, String id) {
  TextEditingController controller = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.yellow[100],
        title: Text('Change Title', style: TextStyle()),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            hintText: 'Change Todo',
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
              ref.read(todoProvider.notifier).changeTodo(id, controller.text);
              controller.clear();
              Navigator.pop(context);
            },
            child: Text(
              'Change',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ),
        ],
      );
    },
  );
}
