// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:notesphere/helpers/snack_bar.dart';
import 'package:notesphere/models/note_model.dart';
import 'package:notesphere/services/note_service.dart';
import 'package:notesphere/utils/constants.dart';
import 'package:notesphere/utils/router.dart';
import 'package:notesphere/utils/text_styles.dart';
import 'package:notesphere/widgets/note_category_card.dart';

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

  // edite note
  void _editNote(Note note) {
    // navigate to the edit_note_screen
    AppRouter.router.push("/edit-note", extra: note);
  }

  // remove note
  Future<void> removeNote(String id) async {
    try {
      await noteService.deleteNote(id);
      if (context.mounted) {
        AppHelpers.showSnackBar(context, "Note Deleted Successfully");
      }
    } catch (e) {
      if (context.mounted) {
        AppHelpers.showSnackBar(context, "Faild to delete note");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            AppRouter.router.push("/notes");
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.eiDefaultPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppConstants.eiDefaultPadding * 1.5),
              Text(widget.category, style: AppTextStyles.appTitle),
              SizedBox(height: AppConstants.eiDefaultPadding * 1.5),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppConstants.eiDefaultPadding,
                  mainAxisSpacing: AppConstants.eiDefaultPadding,
                  childAspectRatio: 7 / 11,
                ),
                itemCount: noteList.length,
                itemBuilder: (context, index) {
                  return NoteCategoryCard(
                    noteTitle: noteList[index].title,
                    noteContent: noteList[index].content,
                    removeNote: () async {
                      await removeNote(noteList[index].id);

                      setState(() {
                        noteList.removeAt(index);
                      });
                    },
                    editNote: () async {
                      _editNote(noteList[index]);
                    },
                    viewSingleNote: () {
                      AppRouter.router.push(
                        "/single-note",
                        extra: noteList[index],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
