import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:notesphere/screens/home_screen.dart';
import 'package:notesphere/screens/note_screen.dart';
import 'package:notesphere/screens/notes_by_category.dart';
import 'package:notesphere/screens/todo_screen.dart';

class AppRouter {
  static final router = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    debugLogDiagnostics: true,
    initialLocation: "/",
    routes: [
      // Home Screen
      GoRoute(
        name: "home",
        path: "/",
        builder: (context, state) {
          return const HomeScreen();
        },
      ),

      // notes Screen
      GoRoute(
        name: "notes",
        path: "/notes",
        builder: (context, state) {
          return const NoteScreen();
        },
      ),

      // todo screen
      GoRoute(
        path: "/todos",
        builder: (context, state) {
          return const TodoScreen();
        },
      ),

      // notes by category page
      GoRoute(
        path: "/category",
        builder: (context, state) {
          final String category = state.extra as String;
          return NotesByCategoryScreen(category: category);
        },
      ),
    ],
  );
}
