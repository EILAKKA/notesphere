import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:notesphere/models/note_model.dart';
import 'package:notesphere/utils/colors.dart';
import 'package:notesphere/utils/constants.dart';
import 'package:notesphere/utils/text_styles.dart';

class SingleNoteScreen extends StatelessWidget {
  final Note note;
  const SingleNoteScreen({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    // Formated Date
    final formatedDate = DateFormat.yMMMd().format(note.date);
    return Scaffold(
      appBar: AppBar(title: Text("Note")),
      body: Padding(
        padding: EdgeInsets.all(AppConstants.eiDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(note.title, style: AppTextStyles.appTitle),
            SizedBox(height: 5),
            Text(
              note.category,
              style: AppTextStyles.appButton.copyWith(
                color: AppColors.eiWhite.withValues(alpha: 0.3),
              ),
            ),
            Text(
              formatedDate,
              style: AppTextStyles.descriptionTitleSmall.copyWith(
                color: AppColors.eiFabColor,
              ),
            ),
            SizedBox(height: 20),
            Text(note.content, style: AppTextStyles.descriptionTitleLarge),
          ],
        ),
      ),
    );
  }
}
