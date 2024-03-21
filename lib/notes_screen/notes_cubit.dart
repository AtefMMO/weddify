import 'package:bloc/bloc.dart';
import 'package:weddify/admin_screens/admin_taps/notes/add_note_to_firebase.dart';

import 'package:weddify/admin_screens/admin_taps/notes/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesState(note: []));
  getNotesList() async {
    try {
      List<NoteData> noteList = await FirebaseUtilsNote.getNoteFromFireBase();
      emit(NotesState(note: noteList));
    } catch (e) {
      print('Error fetching notes: $e');
    }
  }
}
