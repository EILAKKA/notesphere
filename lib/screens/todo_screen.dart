import 'package:flutter/material.dart';
import 'package:notesphere/screens/completed_tab.dart';
import 'package:notesphere/screens/to_do_tab.dart';
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
        onPressed: () {},
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
          ToDoTab(),

          // Completed tab content
          CompletedTab(),
        ],
      ),
    );
  }
}
