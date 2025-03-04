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
  final List<String> shortMonthNames = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formGlobalkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
            maxlength: 500,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoadingState ? true : false,
                onTap: () {
                  if (_formGlobalkey.currentState!.validate()) {
                    String dateTimeString = DateTime.now().toString();
                    DateTime dateTime = DateTime.parse(dateTimeString);

                    String formatedDate =
                        '${shortMonthNames[dateTime.month - 1]} ${dateTime.day},${dateTime.year}';
                    _formGlobalkey.currentState!.save();
                    NoteModel noteModel = NoteModel(
                        color: Colors.blue.value,
                        date: formatedDate,
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
              );
            },
          ),
        ],
      ),
    );
  }
}
