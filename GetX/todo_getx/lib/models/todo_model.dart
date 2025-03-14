class TodoModel {
  String title;
  String subtitle;
  bool isDone;

  String? uid;
  String? docid;

  TodoModel(this.title, this.subtitle, this.isDone, {this.uid, this.docid});

  Map<String, dynamic> toJson() => {
    'title': title,
    'subtitle': subtitle,
    'isDone': isDone,
    'uid': uid,
    'docId': docid,
  };

  TodoModel.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      subtitle = json['subtitle'],
      isDone = json['isDone'],
      uid = json['uid'],
      docid = json['docId'];
}
