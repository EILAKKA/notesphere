import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesphere/helpers/snack_bar.dart';
import 'package:notesphere/models/note_model.dart';
import 'package:notesphere/services/note_service.dart';
import 'package:notesphere/utils/colors.dart';
import 'package:notesphere/utils/constants.dart';
import 'package:notesphere/utils/router.dart';
import 'package:notesphere/utils/text_styles.dart';

class UpdateNoteScreen extends StatefulWidget {
  final Note note;
  const UpdateNoteScreen({super.key, required this.note});

  @override
  State<UpdateNoteScreen> createState() => _UpdateNoteScreenState();
}

class _UpdateNoteScreenState extends State<UpdateNoteScreen> {
  List<String> categories = [];
  final NoteService noteService = NoteService();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _noteTitleController = TextEditingController();
  final TextEditingController _noteContentController = TextEditingController();

  String category = "";

  @override
  void dispose() {
    _noteTitleController.dispose();
    _noteContentController.dispose();

    super.dispose();
  }

  Future _loadCategories() async {
    categories = await noteService.getAllCategories();
    setState(() {});
  }

  @override
  void initState() {
    _noteTitleController.text = widget.note.title;
    _noteContentController.text = widget.note.content;
    category = widget.note.category;
    _loadCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Note', style: AppTextStyles.subTitle)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: AppConstants.eiDefaultPadding / 1.5,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // drop down
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonFormField<String>(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please select a category";
                          }
                          return null;
                        },
                        style: TextStyle(
                          color: AppColors.eiWhite,
                          fontFamily: GoogleFonts.dmSans().fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                        isExpanded: false,
                        hint: Text("Category"),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: AppColors.eiWhite.withValues(alpha: 0.1),
                              width: 2,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: AppColors.eiWhite.withValues(alpha: 0.1),
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: AppColors.eiWhite.withValues(alpha: 0.1),
                              width: 1,
                            ),
                          ),
                        ),
                        items: categories.map((String category) {
                          return DropdownMenuItem<String>(
                            alignment: Alignment.centerLeft,
                            value: category,
                            child: Text(
                              category,
                              style: AppTextStyles.appButton,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            category = value!;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    // title field
                    TextFormField(
                      controller: _noteTitleController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a title";
                        } else {
                          return null;
                        }
                      },
                      maxLines: 2,
                      style: TextStyle(color: AppColors.eiWhite, fontSize: 30),
                      decoration: InputDecoration(
                        hintText: "Note Titile",
                        hintStyle: TextStyle(
                          color: AppColors.eiWhite.withValues(alpha: 0.5),
                          fontSize: 35,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _noteContentController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your content";
                        } else {
                          return null;
                        }
                      },
                      maxLines: 12,
                      style: TextStyle(color: AppColors.eiWhite, fontSize: 20),
                      decoration: InputDecoration(
                        hintText: "Note Content",
                        hintStyle: TextStyle(
                          color: AppColors.eiWhite.withValues(alpha: 0.5),
                          fontSize: 20,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(
                      color: AppColors.eiWhite.withValues(alpha: 0.5),
                      thickness: 1,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              AppColors.eiFabColor,
                            ),
                          ),
                          onPressed:
                              // Save the note
                              () {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    noteService.updateNote(
                                      Note(
                                        title: _noteTitleController.text,
                                        category: category,
                                        content: _noteContentController.text,
                                        date: DateTime.now(),
                                        id: widget.note.id,
                                      ),
                                    );
                                    AppHelpers.showSnackBar(
                                      context,
                                      "Note Updated succesfully",
                                    );

                                    _noteContentController.clear();
                                    _noteTitleController.clear();

                                    AppRouter.router.go("/notes");
                                  } catch (e) {
                                    AppHelpers.showSnackBar(
                                      context,
                                      "Failed to Update note",
                                    );
                                  }
                                }
                              },
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Update Note",
                              style: AppTextStyles.appButton,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
