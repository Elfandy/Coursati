import 'dart:convert';

class Config {
  Config({this.id, required this.language, required this.darkMode});
  final int? id;
  final bool darkMode;
  final int language;

  // Map<String, Object?> toJson() => {
  //       ConfigFields.id: id,
  //       ConfigFields.language: language,
  //       ConfigFields.darkMode: darkMode,
  //     };

  // Config copy({
  //   int? id,
  //   bool? darkMode,
  //   int? language,
  // }) =>
  //     Config(
  //       id: id ?? this.id,
  //       darkMode: darkMode ?? this.darkMode,
  //       language: language ?? this.language,
  //     );

  // static Config fromJson(Map<String, Object?> json) => Config(
  //     id: json[ConfigFields.id] as int,
  //     darkMode: json[ConfigFields.darkMode] as bool,
  //     language: json[ConfigFields.language] as int);
}

// class ConfigFields {
//   static final List<String> values = [id, darkMode, language];
//   static final String id = "_id";

//   static final String darkMode = "darkMode";
//   static final String language = "language";
// }
