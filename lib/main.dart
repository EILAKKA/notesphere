import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesphere/models/note_model.dart';
import 'package:notesphere/models/todo_model.dart';
import 'package:notesphere/utils/router.dart';
import 'package:notesphere/utils/theme_data.dart';

void main() async {
  // initialize hive
  await Hive.initFlutter();

  // register the adapter
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(ToDoAdapter());

  // open hive boxes
  await Hive.openBox('notes');
  await Hive.openBox('todos');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of this application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'NoteSphere',
      debugShowCheckedModeBanner: false,
      theme:
          // This is the theme of this application.
          ThemeDataClass.darkTheme.copyWith(
            textTheme: GoogleFonts.dmSansTextTheme(Theme.of(context).textTheme),
          ),

      routerConfig: AppRouter.router,
    );
  }
}
