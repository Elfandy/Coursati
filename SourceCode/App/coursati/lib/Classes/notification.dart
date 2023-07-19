class NotificationClass {
  NotificationClass(
      {required this.content,
      required this.id,
      required this.readB,
      required this.title});
  int id;
  String title, content;
  int readB;

  NotificationClass.fromJson(Map<String, dynamic> json)
      : content = json['content'],
        id = json['id'],
        readB = json['readB'],
        title = json['title'];
}
