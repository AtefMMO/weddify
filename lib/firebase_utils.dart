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
}

class FirebaseUtilsMerchant {
  static CollectionReference<ItemData> getItemCollection(String uid) {
    return UserFirebaseUtils.getUserCollection().doc(uid).collection(ItemData.collectionName).withConverter<ItemData>(
          fromFirestore: (snapshot, options) => ItemData.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toFireStore(),
        );
  }

  static Future<void> addItemToFirebase(ItemData item, String userId) {
    var collection = getItemCollection(userId);
    var doc = collection.doc();
    item.id = doc.id;

    return doc.set(item);
  }

  static Future<List<ItemData>> getItemFromFireBase(String uid) async {
    List<ItemData> tasks = [];
    QuerySnapshot<ItemData> snapshot = await getItemCollection(uid).get();
    tasks = snapshot.docs.map((doc) => doc.data()).toList();
    return tasks;
  }

  static void updateData(ItemData item, String uid) {
    var collection = getItemCollection(uid);
    var doc = collection.doc(item.id); //gets the specific document with the item id
    doc.update(item.toFireStore()); //updates the documents
  }

  static void deleteData(ItemData item, String uid) {
    var collection = getItemCollection(uid);
    var doc = collection.doc(item.id); //deletes the item by its id
    doc.delete(); //deletes item
  }
}
