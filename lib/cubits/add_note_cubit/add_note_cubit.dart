import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel note) async {
    //* emit the loading state while adding the note
    emit(AddNoteLoadingState());
    try {
      //* adding the note to the notes box
      await Hive.box<NoteModel>(kNotesBox).add(note);
      //* after adding the note emit the success state
      emit(AddNoteSuccessState());
    } catch (e) {
      //* if failed to add the note emit the failure state with the error message
      emit(AddNoteFailureState(e.toString()));
    }
  }

  //! generic function

  Y add<Y>(Y name) {
    return name;
  }

  ///*This function in Dart is a generic function, meaning it can work with any data type. Let's break it down:
  ///
  ///* add<Y> → This declares a generic function where Y is a type parameter.
  ///* (Y name) → The function takes one parameter, name, of type Y.
  ///* return name; → It simply returns the input value of type Y.
  ///
  ///* How It Works:
  ///* Since Y is a generic type, the function can accept and return any data type (int, String, double, List, etc.).
  ///* The actual type of Y is determined when the function is called.
  ///
  ///* Examples of Usage:
  ///* void main() {
  ///*   print(add<int>(10));         // Output: 10
  ///*   print(add<String>("Hello")); // Output: Hello
  ///*   print(add<double>(5.5));     // Output: 5.5
  ///* }
}
