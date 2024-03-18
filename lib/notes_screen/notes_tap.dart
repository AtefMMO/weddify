import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weddify/notes_screen/note._container.dart';

import 'package:weddify/notes_screen/notes_cubit.dart';

class Notes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/startScreen.png',
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(' Find the Best',
                    style: TextStyle(color: Colors.white, fontSize: 24)),
                Text(
                  ' Deals, Anytime,\n Anywhere!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                BlocBuilder<NotesCubit, NotesState>(
                  builder: (context, state) {
                    if (state.note != null && state.note.isNotEmpty) {

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
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                )

              ],
            ),
          ),
        )
      ],
    );
  }
}
