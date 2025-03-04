import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          spacing: 16,
          children: [
            SizedBox(height: 34),
            CustomAppBar(title: 'Edit Note', icon: Icons.check),
            SizedBox(height: 34),
            CustomTextField(hintText: 'title'),
            CustomTextField(hintText: 'Content', maxLines: 15),
          ],
        ),
      ),
    );
  }
}
