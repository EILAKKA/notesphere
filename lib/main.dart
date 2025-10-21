import 'package:flutter/material.dart';
import 'package:notesphere/utils/router.dart';

void main() {
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
      theme: ThemeData(
        // This is the theme of this application.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
