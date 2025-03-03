import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  String? title, subTitle;
  final GlobalKey<FormState> _formGlobalkey = GlobalKey();

  ///!AutovalidateMode.disabled(Default)
  ///*Validation only happens when calling validate(), such as when a form is submitted.
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formGlobalkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        spacing: 16,
        children: [
          CustomTextField(
            hintText: 'Title',
            maxlength: 25,
            onSaved: (value) {
              title = value;
            },
          ),
          CustomTextField(
            hintText: 'Content',
            maxLines: 5,
            maxlength: 150,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          SizedBox(height: 16),
          CustomButton(
            onTap: () {
              if (_formGlobalkey.currentState!.validate()) {
                _formGlobalkey.currentState!.save();
                NoteModel noteModel = NoteModel(
                    color: Colors.blue.value,
                    date: DateTime.now().toString(),
                    subTitle: subTitle!,
                    title: title!);
                BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
              } else {
                ///!AutovalidateMode.always
                ///* Validation runs immediately and continuously, showing errors as soon as the UI loads.
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }

              ///!validate()
              ///* It checks all the form fields inside the Form widget and runs their validator functions.
              ///* If all validators return null (i.e., no errors), the form is considered valid, and validate() returns true.
              ///* If any validator returns a validation error message, the form is invalid, and validate() returns false.

              ///!save()
              ///*Calls the onSaved callback of every TextFormField inside the Form.
              ///*Used to store user input into variables when form submission happens.
            },
          ),
        ],
      ),
    );
  }
}
