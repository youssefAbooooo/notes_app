import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/notes_view.dart';

import 'cubits/notes/notes_cubit.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter is initialized
  //* initialize Hive
  await Hive.initFlutter();
  //* Register the adapter before opening the box, so that the box recognizes the adapter and can store objects of that type.
  Hive.registerAdapter(NoteModelAdapter());
  //* open a hive box (its like a database table or firebase collection)
  if (!Hive.isBoxOpen(kNotesBox)) {
    await Hive.openBox<NoteModel>(kNotesBox);
  }
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const NotesView(),
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
