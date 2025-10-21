import 'package:flutter/material.dart';
import 'package:notesphere/models/note_model.dart';
import 'package:notesphere/services/note_service.dart';

class NotesByCategoryScreen extends StatefulWidget {
  final String category;
  const NotesByCategoryScreen({super.key, required this.category});

  @override
  State<NotesByCategoryScreen> createState() => _NotesByCategoryScreenState();
}

class _NotesByCategoryScreenState extends State<NotesByCategoryScreen> {
  final NoteService noteService = NoteService();
  List<Note> noteList = [];

  @override
  void initState() {
    super.initState();
    _loadNotesByCategory();
  }

  // load all notes by category
  Future<void> _loadNotesByCategory() async {
    noteList = await noteService.getNotesByCategoryNames(widget.category);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(widget.category)));
  }
}
