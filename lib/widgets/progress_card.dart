import 'package:flutter/widgets.dart';
import 'package:notesphere/utils/colors.dart';
import 'package:notesphere/utils/constants.dart';
import 'package:notesphere/utils/text_styles.dart';

class ProgressCardEi extends StatefulWidget {
  final int completedTask;
  final int totalTask;
  const ProgressCardEi({
    super.key,
    required this.completedTask,
    required this.totalTask,
  });

  @override
  State<ProgressCardEi> createState() => _ProgressCardEiState();
}

class _ProgressCardEiState extends State<ProgressCardEi> {
  @override
  Widget build(BuildContext context) {
    // calculation for the completion Percentage
    double completionPercentage = widget.totalTask != 0
        ? (widget.completedTask / widget.totalTask) * 100
        : 0;

    return Container(
      padding: EdgeInsets.all(AppConstants.eiDefaultPadding),
      decoration: BoxDecoration(
        color: EiAppColors.eiCardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Today's Progress", style: AppTextStyles.subTitle),
              SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Text(
                  "You have Completed ${widget.completedTask} out of ${widget.totalTask} task \nkeep up the progress!",
                  style: AppTextStyles.descriptionTitleSmall.copyWith(
                    color: EiAppColors.eiWhite.withValues(alpha: 0.7),
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.width * 0.2,
                decoration: BoxDecoration(
                  gradient: EiAppColors().eiPrimaryGradiant,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Text(
                    "$completionPercentage%",
                    style: AppTextStyles.subTitle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
