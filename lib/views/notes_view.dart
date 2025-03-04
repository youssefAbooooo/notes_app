import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

import 'widgets/add_note_bottom_sheet.dart';
import 'widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotesViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return const AddNoteBottomSheet();
              });
        },
        shape: CircleBorder(),
        backgroundColor: kPrimaryColor,
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
