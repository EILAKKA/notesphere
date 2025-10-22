import 'package:flutter/material.dart';
import 'package:notesphere/utils/colors.dart';
import 'package:notesphere/utils/text_styles.dart';

class CategoryInputBottomSheet extends StatefulWidget {
  final Function() onNewNote;
  final Function() onNewCategory;
  const CategoryInputBottomSheet({
    super.key,
    required this.onNewNote,
    required this.onNewCategory,
  });

  @override
  State<CategoryInputBottomSheet> createState() =>
      _CategoryInputBottomSheetState();
}

class _CategoryInputBottomSheetState extends State<CategoryInputBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        color: AppColors.eiCardColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            InkWell(
              onTap: widget.onNewNote,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    " Create a New Note",
                    style: AppTextStyles.descriptionTitleLarge,
                  ),
                  Icon(Icons.arrow_right_outlined),
                ],
              ),
            ),
            SizedBox(height: 30),
            Divider(
              color: AppColors.eiWhite.withValues(alpha: 0.3),
              thickness: 1,
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: widget.onNewCategory,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    " Create a New Note Category",
                    style: AppTextStyles.descriptionTitleLarge,
                  ),
                  Icon(Icons.arrow_right_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
