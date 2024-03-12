import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weddify/login/user_data.dart';
import 'package:weddify/models/item_model.dart';

class UserFirebaseUtils {
  static CollectionReference<UserData> getUserCollection() {
    return FirebaseFirestore.instance.collection(UserData.collectionName).withConverter(
          fromFirestore: (snapshot, options) => UserData.fromJson(snapshot.data()!),
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
    getUserCollection().doc(user.id).collection(UserData.collectionName).doc().delete();
    return getUserCollection().doc(user.id).delete();
  }

  static DocumentReference<ItemModel> getItemCollection(String id) {
    return FirebaseFirestore.instance.collection(UserData.collectionName).doc(id).collection('merchant').doc().withConverter(
          fromFirestore: (snapshot, options) => ItemModel.fromJson(snapshot.data()!),
          toFirestore: (item, options) => item.toFireStore(),
        );
  }



  static Future<void> addItemToDb(ItemModel item, String id) {
    return getItemCollection(id).set(item);
  }
}
