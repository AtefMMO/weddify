import 'dart:io';

class ItemModel {
  static const String collectionName = 'user';
  String? title;
  String? description;
  String? price;
  File? selectedImage;

  ItemModel({this.title, this.description, this.price, this.selectedImage});

  Map<String, dynamic> toFireStore() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'selectedImage': selectedImage,
    };
  }

  ItemModel.fromJson(Map<String, dynamic> itemModel) {}
}
