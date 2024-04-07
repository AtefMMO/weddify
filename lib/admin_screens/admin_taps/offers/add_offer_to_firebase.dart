import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'offer_model.dart';

class FirebaseUtilsOffer {
  static CollectionReference<OfferData> getOfferCollection() {
    // Return the collection reference to the "offers" collection
    return FirebaseFirestore.instance.collection(OfferData.collectionName).withConverter<OfferData>(
          fromFirestore: (snapshot, options) => OfferData.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
  }

  static Future<void> addOfferToFirebase(OfferData offer) async {
    var collection = getOfferCollection();
    var doc = collection.doc(); // Generate a new document ID
    offer.id = doc.id;
    final storageRef = FirebaseStorage.instance.ref().child('items_images').child('${offer.id}.jpg');
    if (offer.offerImg != null) {
      await storageRef.putFile(offer.offerImg!); // send the selected image url to firebase

      final imageUrl = await storageRef.getDownloadURL();
      offer.imgLink = imageUrl;
    }
    return doc.set(offer); // Add offer to the "offers" collection
  }

  static Future<List<OfferData>> getOfferFromFireBase() async {
    List<OfferData> offers = [];
    QuerySnapshot<OfferData> snapshot = await getOfferCollection().get(); // Get all documents from "offers"
    offers = snapshot.docs.map((doc) => doc.data()).toList();
    return offers;
  }

  static void updateData(OfferData offer) {
    var collection = getOfferCollection();
    var doc = collection.doc(offer.id); // Get specific offer document
    doc.update(offer.toJson()); // Update the offer document
  }

  static void deleteData(OfferData offer) {
    var collection = getOfferCollection();
    var doc = collection.doc(offer.id); // Get specific offer document
    doc.delete(); // Delete the offer document
  }
}
