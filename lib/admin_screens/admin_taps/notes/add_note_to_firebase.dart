import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weddify/admin_screens/admin_taps/notes/note_model.dart';



class AdminFirebaseUtils {
  static CollectionReference<NoteData> getNoteCollection() {
    // Return the collection reference to the "notes" collection
    return FirebaseFirestore.instance
        .collection(NoteData.collectionName)
        .withConverter<NoteData>(
      fromFirestore: (snapshot, options) =>
         NoteData.fromJson(snapshot.data()!),
      toFirestore: (value, options) => value.toJson(),
    );
  }

  static Future<void> addNoteToFirebase(NoteData note) {
    var collection = getNoteCollection();
    var doc = collection.doc(); // Generate a new document ID
    note.id = doc.id;
    return doc.set(note); // Add note to the "notes" collection
  }

  static Future<List<NoteData>> getNoteFromFireBase() async {
    List<NoteData> notes = [];
    QuerySnapshot<NoteData> snapshot =
    await getNoteCollection().get(); // Get all documents from "notes"
    notes = snapshot.docs.map((doc) => doc.data()).toList();
    return notes;
  }

  static void updateData(NoteData note) {
    var collection = getNoteCollection();
    var doc = collection.doc(note.id); // Get specific note document
    doc.update(note.toJson()); // Update the note document
  }

  static void deleteData(NoteData note) {
    var collection = getNoteCollection();
    var doc = collection.doc(note.id); // Get specific note document
    doc.delete(); // Delete the note document
  }
}