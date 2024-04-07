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
    required this.offerImg,
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

  OfferData.fromJson(Map<String, dynamic> offerData) {
    id = offerData['id'] as String?;
    title = offerData['title'];
    description = offerData['description'];
    offerImg = offerData['offerImg'];
    imgLink = offerData['imgLink'];
  }
}
