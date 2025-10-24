import 'package:flutter/material.dart';
import 'package:notesphere/models/todo_model.dart';
import 'package:notesphere/utils/colors.dart';
import 'package:notesphere/utils/text_styles.dart';

class ToDoCard extends StatefulWidget {
  final ToDo toDo;
  final bool isCompleted;
  final Function() onCheckBoxChanged;
  const ToDoCard({
    super.key,
    required this.toDo,
    required this.isCompleted,
    required this.onCheckBoxChanged,
  });

  @override
  State<ToDoCard> createState() => _ToDoCardState();
}

class _ToDoCardState extends State<ToDoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(color: AppColors.eiCardColor),
      child: ListTile(
        title: Text(
          widget.toDo.title,
          style: AppTextStyles.descriptionTitleLarge,
        ),
        subtitle: Row(
          children: [
            Text(
              "${widget.toDo.date.day} /${widget.toDo.date.month} /${widget.toDo.date.year}",
              style: AppTextStyles.descriptionTitleSmall.copyWith(
                color: AppColors.eiWhite.withValues(alpha: 0.5),
              ),
            ),
            SizedBox(width: 10),
            Text(
              "${widget.toDo.time.hour}:${widget.toDo.time.minute} ",
              style: AppTextStyles.descriptionTitleSmall.copyWith(
                color: AppColors.eiWhite.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
        trailing: Checkbox(
          value: widget.isCompleted,
          onChanged: (value) => widget.onCheckBoxChanged(),
        ),
      ),
    );
  }
}
