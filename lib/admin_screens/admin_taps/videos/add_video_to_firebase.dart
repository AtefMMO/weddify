import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:weddify/admin_screens/admin_taps/videos/video_model.dart';

class FirebaseUtilsVideo {
  static CollectionReference<VideoData> getVideoCollection() {
    // Return the collection reference to the "Video" collection
    return FirebaseFirestore.instance
        .collection(VideoData.collectionName)
        .withConverter<VideoData>(
          fromFirestore: (snapshot, options) =>
              VideoData.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
  }

  static Future<void> addVideoToFirebase(VideoData video) async {
    var collection = getVideoCollection();
    var doc = collection.doc(); // Generate a new document ID
    video.id = doc.id;

    if (video.image != null) {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('videos')
          .child('${video.id}.jpg'); // create path in Firebase Storage
      try {
        await storageRef.putFile(video.image!);

        final imageUrl = await storageRef.getDownloadURL();
        video.imageUrl = imageUrl;
      } catch (e) {
        print('Error uploading image: $e');
      }
    }

    try {
      await doc.set(video);
    } catch (e) {
      print('Error adding video to Firestore: $e');
    }
  }

  static Future<List<VideoData>> getVideoFromFireBase() async {
    List<VideoData> videos = [];
    QuerySnapshot<VideoData> snapshot =
        await getVideoCollection().get(); // Get all documents from "videos"
    videos = snapshot.docs.map((doc) => doc.data()).toList();
    return videos;
  }

  static void updateData(VideoData video) {
    var collection = getVideoCollection();
    var doc = collection.doc(video.id); // Get specific video document
    doc.update(video.toJson()); // Update the video document
  }

  static void deleteData(VideoData video) {
    var collection = getVideoCollection();
    var doc = collection.doc(video.id); // Get specific video document
    doc.delete(); // Delete the video document
  }
}
