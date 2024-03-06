class NoteData {
  //data class used to save task in the data base
  static const String collectionName = 'Notes';
  String? id;
  String? title;
  String? description;

  NoteData({
    this.id = '',
    required this.title,
    required this.description,
  });
  Map<String, dynamic> toJson() {
    //convert class data to json so we can save it on firebase
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  NoteData.fromJson(Map<String, dynamic> taskData) {
    id = taskData['id'] as String?;
    title = taskData['title'];
    description = taskData['description'];
  }
}
