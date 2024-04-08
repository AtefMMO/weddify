import 'dart:io';

class VideoData {
  //data class used to save task in the data base
  static const String collectionName = 'Videos';
  String? id;
  String? title;
  String? url;
  File? image;
  String?imageUrl;
  VideoData({
    this.id = '',
    required this.title,
    required this.url,
    required this.image
  });
  Map<String, dynamic> toJson() {
    //convert class data to json so we can save it on firebase
    return {
      'id': id,
      'title': title,
      'url': url,
      'imageUrl': imageUrl,
    };
  }

  VideoData.fromJson(Map<String, dynamic> videoData) {
    id = videoData['id'] as String?;
    title = videoData['title'];
    url = videoData['url'];
    image=videoData['image'];
    imageUrl=videoData['imageUrl'];
  }
}
