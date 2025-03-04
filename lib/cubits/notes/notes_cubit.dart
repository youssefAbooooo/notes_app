import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitialState());

  List<NoteModel>? notesList;

  getNotes() {
    notesList = Hive.box<NoteModel>(kNotesBox).values.toList();
    if (notesList == null || notesList!.isEmpty) {
      emit(NotesEmptyState());
    } else {
      emit(NotesSuccessState());
    }
  }
}
