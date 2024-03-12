import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weddify/firebase_utils.dart';
import 'package:weddify/models/item_model.dart';


class FirebaseUtilsMerchant {
  static CollectionReference<ItemData> getItemCollection(String uid) {

    return UserFirebaseUtils.getUserCollection()
        .doc(uid)
        .collection(ItemData.collectionName)
        .withConverter<ItemData>(
        fromFirestore: (snapshot, options) =>
            ItemData.fromJson(snapshot.data()!),
        toFirestore: (value, options) => value.toFireStore());
  }

  static Future<void> addItemToFirebase(ItemData item, String userId) {
    //method that adds the item to the database
    var collection =
    getItemCollection(userId); //make a collection or get it if available
    var doc = collection.doc(); //make doc of item
    item.id = doc
        .id; //auto generated id for the doc we need to assign it to the item data class

    return doc.set(item); //add it to the database
  }

  static Future<List<ItemData>> getItemFromFireBase(String uid) async {
    List<ItemData> tasks = [];
    QuerySnapshot<ItemData> snapshot = await getItemCollection(uid)
        .get(); //gets all the documents in the collection
    tasks = snapshot.docs
        .map((doc) => doc.data())
        .toList(); //takes the data inside each document and adds them to list of type item data
    return tasks;
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