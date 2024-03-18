import 'package:flutter/material.dart';
import 'package:weddify/admin_screens/admin_taps/notes/add_note_screen.dart';
import 'package:weddify/admin_screens/admin_taps/notes/add_note_to_firebase.dart';
import 'package:weddify/admin_screens/admin_taps/notes/note_container_admin.dart';
import 'package:weddify/admin_screens/admin_taps/notes/note_model.dart';


class NotesAdmin extends StatefulWidget {

  @override
  State<NotesAdmin> createState() => _NotesAdminState();
}

class _NotesAdminState extends State<NotesAdmin> {
  late List<NoteData> notes;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    CircularProgressIndicator();
    loadNotes();
  }
  void loadNotes() async {
    // Set isLoading to true when loading starts
    setState(() {
      isLoading = true;
    });

    // Retrieve offers asynchronously and assign them to the ntoes variable
    notes = await AdminFirebaseUtils.getNoteFromFireBase();

    // Set isLoading to false when loading finishes
    setState(() {
      isLoading = false;
    });
  }
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
          EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
          child: Column(
            children: [
              Row(

                children: [
                  ElevatedButton(
                    onPressed: () {
                      showAddNoteScreen(context);

                    },
                    child: Text('Add Note'),
                  ),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: () {
                      loadNotes();

                    },
                    child: Text('ReLoad'),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),

              isLoading ?Center(child: CircularProgressIndicator(color: Colors.white,)):   Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return noteContainerAdmin(
                      note: notes[index],);
                  },
                  itemCount: notes.length,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
  void showAddNoteScreen(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => AddNoteScreen());
  }
}