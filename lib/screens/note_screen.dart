import 'package:flutter/material.dart';
import 'package:notesphere/utils/colors.dart';
import 'package:notesphere/utils/constants.dart';
import 'package:notesphere/utils/router.dart';
import 'package:notesphere/utils/text_styles.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            AppRouter.router.go("/");
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          side: BorderSide(color: EiAppColors.eiWhite, width: 2),
        ),

        child: Icon(Icons.add, color: EiAppColors.eiWhite, size: 30),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppConstants.eiDefaultPadding),
        child: Column(children: [Text("Notes", style: AppTextStyles.appTitle)]),
      ),
    );
  }
}
