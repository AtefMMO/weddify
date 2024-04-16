import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weddify/login/user_data.dart';
import 'package:weddify/models/item_model.dart';

class FireBaseUtilsMarket {
  static getUsers() async {
    CollectionReference users = FirebaseFirestore.instance.collection('user');

    try {
      QuerySnapshot querySnapshot = await users.where('isMerchant', isEqualTo: true).get();

      List<UserData> userList = querySnapshot.docs.map((doc) {
        return UserData(id: doc.id);
      }).toList();
      print(userList[0].id); //correct
      return userList;
    } catch (e) {
      print('Error fetching users: $e');
    }
  }

  static Future<List<ItemData>> getItemsForUser(String userId) async {
    CollectionReference userItems = FirebaseFirestore.instance.collection('user').doc(userId).collection('Items');

    try {
      QuerySnapshot itemSnapshot = await userItems.get();

      List<ItemData> itemList = itemSnapshot.docs.map((doc) {
        return ItemData.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      print(itemList[0].category); //correct
      return itemList;
    } catch (e) {
      print('Error fetching items for user: $e');
      throw e; // Rethrow the exception to handle it outside if needed
    }
  }

  static Future<List<ItemData>> getAllMerchantItems() async {
    try {
      List<UserData> userList = await getUsers();

      List<ItemData> allItems = [];
      for (UserData user in userList) {
        List<ItemData> itemsForUser = await getItemsForUser(user.id!);
        allItems.addAll(itemsForUser);
      }
      print(allItems[0].category); //correct
      return allItems;
    } catch (e) {
      print('Error fetching all merchant items: $e');
      throw e; // Rethrow the exception to handle it outside if needed
    }
  }

  static Future<List<ItemData>> getAllMerchantItemsByCategory(String category) async {
    try {
      List<ItemData> allItems = await getAllMerchantItems();

      // Filter items by category
      List<ItemData> itemsWithCategory = allItems.where((item) => item.category == category).toList();

      return itemsWithCategory;
    } catch (e) {
      print('Error fetching merchant items by category: $e');
      throw e; // Rethrow the exception to handle it outside if needed
    }
  }
}
