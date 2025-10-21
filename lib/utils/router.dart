import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:notesphere/screens/home_screen.dart';

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
    ],
  );
}
