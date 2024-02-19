import 'package:firebase_auth/firebase_auth.dart';

class UserData{
  String name='';
  String email='';
  String id='';
  bool isAdmin=false;
  UserData({required this.email,required this.name,required this.id,required this.isAdmin});
  Map<String, dynamic> toFireStore() {
    return {'name': name, 'email': email, 'id': id,'isAdmin':isAdmin};
  }

  UserData.fromJson(Map<String, dynamic> userData) {
    name = userData['name'];
    email = userData['email'];
    id = userData['id'];
    isAdmin=userData['isAdmin'];
  }
}