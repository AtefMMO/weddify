import 'dart:io';

class ItemData {
  static const String collectionName = 'Items';
  String? title;
  String? description;
  String? price;
  String? id;
  String? imageUrl;
  File? selectedImage;
  String? category;
  String? seller;
  ItemData({this.title, this.description, this.price, this.id, this.imageUrl, this.selectedImage, this.category,this.seller});

  Map<String, dynamic> toFireStore() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'id': id,
      'imageUrl': imageUrl,
      'category':category,
      'seller':seller
    };
  }

  ItemData.fromJson(Map<String, dynamic> itemModel) {
    title = itemModel['title'];
    description = itemModel['description'];
    price = itemModel['price'];
    id = itemModel['id'];
    imageUrl = itemModel['imageUrl'];
    selectedImage = itemModel['selectedImage'];
    category=itemModel['category'];
    seller=itemModel['seller'];
  }
}
