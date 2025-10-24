// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:notesphere/helpers/snack_bar.dart';
import 'package:notesphere/models/todo_model.dart';
import 'package:notesphere/services/todo_service.dart';
import 'package:notesphere/widgets/to_do_card.dart';

class CompletedTab extends StatefulWidget {
  final List<ToDo> completedTodos;
  final List<ToDo> inCompletedTodos;
  const CompletedTab({
    super.key,
    required this.completedTodos,
    required this.inCompletedTodos,
  });

  @override
  State<CompletedTab> createState() => _CompletedTabState();
}

class _CompletedTabState extends State<CompletedTab> {
  // mark todo as undone
  void _markTodoAsUnDone(ToDo todo) async {
    try {
      final ToDo updatedToDo = ToDo(
        title: todo.title,
        date: todo.date,
        time: todo.time,
        isDone: false,
      );

      await ToDoService().markAsDone(updatedToDo);

      // Snack Bar

      AppHelpers.showSnackBar(context, "Marked As Un Done");
      setState(() {
        widget.completedTodos.remove(todo);
        widget.inCompletedTodos.add(todo);
      });
    } catch (e) {
      AppHelpers.showSnackBar(context, "Failed to mark as undone");
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      widget.completedTodos.sort((a, b) => a.time.compareTo(b.time));
    });
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: widget.completedTodos.length,
              itemBuilder: (context, index) {
                final ToDo todo = widget.completedTodos[index];
                return ToDoCard(
                  toDo: todo,
                  isCompleted: true,
                  onCheckBoxChanged: () => _markTodoAsUnDone(todo),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
