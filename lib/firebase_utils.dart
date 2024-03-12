import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weddify/login/user_data.dart';

class UserFirebaseUtils {
  static CollectionReference<UserData> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(UserData.collectionName)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              UserData.fromJson(snapshot.data()!),
          toFirestore: (user, options) => user.toFireStore(),
        );
  }

  static Future<void> addUserToDb(UserData user) {
    return getUserCollection().doc(user.id).set(user);
  }

  static Future<UserData?> readUserFromDb(String id) async {
    var doc = await getUserCollection().doc(id).get();
    return doc.data();
  }

  static Future<void> deleteUserFromDb(UserData user) {
    getUserCollection()
        .doc(user.id)
        .collection(UserData.collectionName)
        .doc()
        .delete();
    return getUserCollection().doc(user.id).delete();
  }
}
