import 'package:flutter/material.dart';
import 'package:notesphere/helpers/snack_bar.dart';
import 'package:notesphere/models/todo_model.dart';
import 'package:notesphere/widgets/Tabs/completed_tab.dart';
import 'package:notesphere/widgets/Tabs/to_do_tab.dart';
import 'package:notesphere/services/todo_service.dart';
import 'package:notesphere/utils/colors.dart';
import 'package:notesphere/utils/text_styles.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<ToDo> allTodos = [];
  late List<ToDo> inCompletedTodos = [];
  late List<ToDo> completedTodos = [];
  ToDoService toDoService = ToDoService();
  final TextEditingController _taskController = TextEditingController();
  @override
  void dispose() {
    _tabController;
    _taskController;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _checkIfUserNew();
  }

  void _checkIfUserNew() async {
    final bool isNewUser = await toDoService.isNewUser();

    if (isNewUser) {
      await toDoService.createInitialTodos();
    }
    _loadToDos();
  }

  Future<void> _loadToDos() async {
    final List<ToDo> loadedTodos = await toDoService.loadTodos();
    setState(() {
      allTodos = loadedTodos;
      // incompleted Todos
      inCompletedTodos = allTodos.where((todo) => !todo.isDone).toList();
      // completed todos
      completedTodos = allTodos.where((todo) => todo.isDone).toList();
    });
  }

  // method to add task
  void _addTask() async {
    try {
      if (_taskController.text.isNotEmpty) {
        final ToDo newTodo = ToDo(
          title: _taskController.text,
          date: DateTime.now(),
          time: DateTime.now(),
          isDone: false,
        );
        await toDoService.addTodo(newTodo);
        setState(() {
          allTodos.add(newTodo);
          inCompletedTodos.add(newTodo);
        });

        AppHelpers.showSnackBar(context, "Task Added");
      }
    } catch (e) {
      AppHelpers.showSnackBar(context, "Faild to add task");
    }
  }

  void openMessageModel(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.eiCardColor,
          contentPadding: EdgeInsets.zero,
          title: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Add Task",
              style: AppTextStyles.descriptionTitleLarge.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: _taskController,
              style: TextStyle(color: AppColors.eiWhite, fontSize: 20),
              decoration: InputDecoration(
                hintText: "Enter Your Task",
                hintStyle: AppTextStyles.descriptionTitleSmall,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                _addTask();
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.eiFabColor),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              child: Text("Add Task", style: AppTextStyles.appButton),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.eiBgColor),
              ),
              child: Text("Cancel", style: AppTextStyles.appButton),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(child: Text('ToDo', style: AppTextStyles.appButton)),
            Tab(child: Text("Completed", style: AppTextStyles.appButton)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openMessageModel(context);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          side: BorderSide(color: AppColors.eiWhite, width: 2),
        ),
        child: Icon(Icons.add, color: AppColors.eiWhite, size: 30),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // ToDo tab content
          ToDoTab(
            inCompletedTodos: inCompletedTodos,
            completedTodos: completedTodos,
          ),

          // Completed tab content
          CompletedTab(
            completedTodos: completedTodos,
            inCompletedTodos: inCompletedTodos,
          ),
        ],
      ),
    );
  }
}
