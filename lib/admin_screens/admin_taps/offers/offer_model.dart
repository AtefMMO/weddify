import 'dart:io';

class OfferData {
  //data class used to save task in the data base
  static const String collectionName = 'Offers';
  String? id;
  String? title;
  String? description;
  File? offerImg;
  String? imgLink;

  OfferData({
    this.id = '',
    required this.title,
    required this.description,
    this.offerImg,
    this.imgLink,
  });
  Map<String, dynamic> toJson() {
    //convert class data to json so we can save it on firebase
    return {
      'id': id,
      'title': title,
      'description': description,
      'imgLink': imgLink,
    };
  }

  OfferData.fromJson(Map<String, dynamic> taskData) {
    id = taskData['id'] as String?;
    title = taskData['title'];
    description = taskData['description'];
    offerImg = taskData['offerImg'];
    imgLink = taskData['imgLink'];
  }
}
