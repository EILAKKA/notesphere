import 'package:notesphere/models/todo_model.dart';

class TodoService {
  List<ToDo> todos = [
    ToDo(
      title: "Read a Book",
      date: DateTime.now(),
      time: DateTime.now(),
      isDone: true,
    ),
    ToDo(
      title: "Go for a Walk",
      date: DateTime.now(),
      time: DateTime.now(),
      isDone: false,
    ),
    ToDo(
      title: "Complete Assignment",
      date: DateTime.now(),
      time: DateTime.now(),
      isDone: false,
    ),
  ];
}
