import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weddify/notes_screen/note._container.dart';
import 'package:weddify/notes_screen/notes_cubit.dart';

class Notes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(' Find the Best', style: TextStyle(color: Colors.black, fontSize: 24)),
            const Text(
              ' Deals, Anytime,\n Anywhere!',
              style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
            ),
            BlocBuilder<NotesCubit, NotesState>(
              builder: (context, state) {
                if (state.note.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.note.length,
                      itemBuilder: (context, index) {
                        return Note(note: state.note[index]);
                      },
                    ),
                  );
                } else {
                  BlocProvider.of<NotesCubit>(context).getNotesList();
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
