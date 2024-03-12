class ItemData {
  static const String collectionName = 'Items';
  String? title;
  String? description;
  String? price;
  String? id;
  // File? selectedImage;

  ItemData({this.title, this.description, this.price, this.id

      // this.selectedImage,
      });

  Map<String, dynamic> toFireStore() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'id': id
      // 'selectedImage': selectedImage,
    };
  }

  ItemData.fromJson(Map<String, dynamic> itemModel) {
    title = itemModel['title'];
    description = itemModel['description'];
    price = itemModel['price'];
    id = itemModel['id'];
  }
}
