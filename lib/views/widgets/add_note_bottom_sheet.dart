import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        spacing: 16,
        children: [
          SizedBox(height: 16),
          CustomTextField(hintText: 'Title'),
          CustomTextField(hintText: 'Content', maxLines: 5),
        ],
      ),
    );
  }
}
