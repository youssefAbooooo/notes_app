import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

import 'add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccessState) {
            Navigator.pop(context);
          }
          if (state is AddNoteFailureState) {
            log('failed ${state.errorMessage}');
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoadingState
                ? true //* if state is addNoteLoadingState, then don't allow pressing on the screen.
                : false, //* else, allow pressing on the screen.
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 32.0,
                bottom: MediaQuery.of(context)
                    .viewInsets
                    .bottom, //!this line will make padding when the keyboard is shown = the height of the keyboard
              ),
              child: AddNoteForm(),
            ),
          );
        },
      ),
    );
  }
}
