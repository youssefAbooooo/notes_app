import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_button.dart';

import 'custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 32.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          spacing: 16,
          children: [
            CustomTextField(hintText: 'Title'),
            CustomTextField(hintText: 'Content', maxLines: 5),
            SizedBox(height: 16),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}
