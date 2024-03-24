import 'dart:io';

class ItemData {
  static const String collectionName = 'Items';
  String? title;
  String? description;
  String? price;
  String? id;
  String? imageUrl;
  File? selectedImage;
  List <String> categories=['اجهزة منزلية','ادوات منزلية','أثاث','مفروشات','قاعات','شركات ليموزين','مطابخ','ادوات كهربائية','ادوات صحية','ديكورات'];
  ItemData({this.title, this.description, this.price, this.id, this.imageUrl, this.selectedImage});

  Map<String, dynamic> toFireStore() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'id': id,
      'imageUrl': imageUrl,
    };
  }

  ItemData.fromJson(Map<String, dynamic> itemModel) {
    title = itemModel['title'];
    description = itemModel['description'];
    price = itemModel['price'];
    id = itemModel['id'];
    imageUrl = itemModel['imageUrl'];
    selectedImage = itemModel['selectedImage'];
  }
}
