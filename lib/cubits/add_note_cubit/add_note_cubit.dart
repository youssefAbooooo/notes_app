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

  Y add<Y>(Y name) {
    return name;
  }
}
