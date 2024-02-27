import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  static const String collectionName = 'user';
  String name = '';
  String email = '';
  String id = '';
  bool isAdmin = false;
  bool isMerchant = false;
  UserData(
      {required this.email,
      required this.name,
      required this.id,
      required this.isAdmin,
      required this.isMerchant});
  Map<String, dynamic> toFireStore() {
    return {
      'name': name,
      'email': email,
      'id': id,
      'isAdmin': isAdmin,
      'isMerchant': isMerchant
    };
  }

  UserData.fromJson(Map<String, dynamic> userData) {
    name = userData['name'];
    email = userData['email'];
    id = userData['id'];
    isAdmin = userData['isAdmin'];
    isMerchant = userData['isMerchant'];
  }
}
