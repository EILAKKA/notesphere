import 'package:flutter/material.dart';
import 'package:notesphere/utils/colors.dart';
import 'package:notesphere/utils/constants.dart';
import 'package:notesphere/utils/text_styles.dart';

class NotesCard extends StatelessWidget {
  final String noteCategory;
  final int noOfNotes;
  const NotesCard({
    super.key,
    required this.noteCategory,
    required this.noOfNotes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstants.eiDefaultPadding),
      decoration: BoxDecoration(
        color: EiAppColors.eiCardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 5)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            noteCategory,
            style: AppTextStyles.subTitle.copyWith(fontWeight: FontWeight.w500),
          ),
          Text(
            '$noOfNotes notes',
            style: AppTextStyles.appBody.copyWith(
              color: EiAppColors.eiWhite.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}
