import 'package:flutter/material.dart';
import 'package:notesphere/utils/constants.dart';
import 'package:notesphere/utils/router.dart';
import 'package:notesphere/utils/text_styles.dart';
import 'package:notesphere/widgets/notes_todo_card.dart';
import 'package:notesphere/widgets/progress_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("NoteSphere", style: AppTextStyles.appTitle)),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ProgressCardEi(completedTask: 5, totalTask: 5),
            SizedBox(height: AppConstants.eiDefaultPadding * 1.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    // goto the note screen
                    AppRouter.router.push("/notes");
                  },
                  child: NotesTodoCard(
                    title: 'Notes',
                    description: '3 Notes',
                    icon: Icons.bookmark_add_outlined,
                  ),
                ),
                InkWell(
                  onTap: () {
                    AppRouter.router.push("/todos");
                  },
                  child: NotesTodoCard(
                    title: 'To-Do List',
                    description: '3 Task',
                    icon: Icons.today_outlined,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppConstants.eiDefaultPadding * 1.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Today's Progress", style: AppTextStyles.subTitle),
                Text("See All", style: AppTextStyles.appButton),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
