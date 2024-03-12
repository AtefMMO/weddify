class UserData {
  static const String collectionName = 'user';
  String? name;
  String? email;
  String ?id ;
  bool? isAdmin = false;
  bool? isMerchant = false;
  UserData({
    this.email,
    this.name,
    required this.id,
    this.isAdmin,
    this.isMerchant,
  });
  Map<String, dynamic> toFireStore() {
    return {'name': name, 'email': email, 'id': id, 'isAdmin': isAdmin, 'isMerchant': isMerchant};
  }

  UserData.fromJson(Map<String, dynamic> userData) {
    name = userData['name'];
    email = userData['email'];
    id = userData['id'];
    isAdmin = userData['isAdmin'];
    isMerchant = userData['isMerchant'];
  }
}
