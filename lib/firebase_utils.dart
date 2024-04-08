import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:weddify/cache_helper.dart';

import 'package:weddify/login/user_data.dart';
import 'package:weddify/models/item_model.dart';

import 'constants.dart';

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

  static UserData? userModel;
  static bool isReady=false;
  static readUserFromDb() {
    FirebaseFirestore.instance.collection('user').doc(uid).get().then((value) {
      userModel = UserData.fromJson(value.data()!);
      isAdmin = userModel!.isAdmin;
      isMerchant = userModel!.isMerchant;
      CacheHelper.saveData(key: 'isAdmin', value: isAdmin);
      CacheHelper.saveData(key: 'isMerchant', value: isMerchant);
      isReady=true;

    }).catchError((error) {});
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

class FirebaseUtilsMerchant {
  static CollectionReference<ItemData> getItemCollection(String uid) {
    return UserFirebaseUtils.getUserCollection()
        .doc(uid)
        .collection(ItemData.collectionName)
        .withConverter<ItemData>(
          fromFirestore: (snapshot, options) =>
              ItemData.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toFireStore(),
        );
  }

  static Future<void> addItemToFirebase(ItemData item, String userId) async {
    var collection = getItemCollection(userId);
    var doc = collection.doc();
    item.id = doc.id;
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('items_images')
        .child('$userId.jpg'); // create path in firebase
    if (item.selectedImage != null) {
      await storageRef.putFile(
          item.selectedImage!); // send the selected image url to firebase

      final imageUrl = await storageRef.getDownloadURL();
      item.imageUrl = imageUrl;
    }
    return doc.set(item);
  }

  static Future<List<ItemData>> getItemFromFireBase(String uid) async {
    List<ItemData> items = [];
    QuerySnapshot<ItemData> snapshot = await getItemCollection(uid).get();
    items = snapshot.docs.map((doc) => doc.data()).toList();
    return items;
  }

  static void updateData(ItemData item, String uid) {
    var collection = getItemCollection(uid);
    var doc =
        collection.doc(item.id); //gets the specific document with the item id
    doc.update(item.toFireStore()); //updates the documents
  }

  static void deleteData(ItemData item, String uid) {
    var collection = getItemCollection(uid);
    var doc = collection.doc(item.id); //deletes the item by its id
    doc.delete(); //deletes item
  }
}
