class Tag {
  Tag({required this.id, required this.name_ar, required this.name_en});
  int? id;
  String? name_ar, name_en;

  Map<String, dynamic> toJson() =>
      {"id": id, "NameAR": name_ar, "NameEN": name_en};

  Tag.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name_ar = json["NameAR"],
        name_en = json["NameEN"];

        
}

// class TagFields {
//   static final String id = "_id";
//   static final String name_ar = "name_ar";

//   static final String name_en = "name_en";
// }
