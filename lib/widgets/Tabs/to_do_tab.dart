// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:notesphere/helpers/snack_bar.dart';
import 'package:notesphere/models/todo_model.dart';
import 'package:notesphere/services/todo_service.dart';
import 'package:notesphere/widgets/to_do_card.dart';

class ToDoTab extends StatefulWidget {
  final List<ToDo> inCompletedTodos;
  final List<ToDo> completedTodos;

  const ToDoTab({
    super.key,
    required this.inCompletedTodos,
    required this.completedTodos,
  });

  @override
  State<ToDoTab> createState() => _ToDoTabState();
}

class _ToDoTabState extends State<ToDoTab> {
  // mark todo as done
  void _markTodoAsDone(ToDo todo) async {
    try {
      final ToDo updatedToDo = ToDo(
        title: todo.title,
        date: todo.date,
        time: todo.time,
        isDone: true,
      );

      await ToDoService().markAsDone(updatedToDo);

      // Snack Bar

      AppHelpers.showSnackBar(context, "Marked As Done");
      setState(() {
        widget.inCompletedTodos.remove(todo);
        widget.completedTodos.add(updatedToDo);
      });
    } catch (e) {
      AppHelpers.showSnackBar(context, "Failed to mark as done");
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      widget.inCompletedTodos.sort((a, b) => a.time.compareTo(b.time));
    });
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: widget.inCompletedTodos.length,
              itemBuilder: (context, index) {
                final ToDo todo = widget.inCompletedTodos[index];
                return ToDoCard(
                  toDo: todo,
                  isCompleted: false,
                  onCheckBoxChanged: () => _markTodoAsDone(todo),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
