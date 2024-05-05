// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TeachModel {
  final String description;
  final String time;
  final String title;
  final String url;
  final String pathimg;
  TeachModel({
    required this.description,
    required this.time,
    required this.title,
    required this.url,
    required this.pathimg,
  });

  TeachModel copyWith({
    String? description,
    String? time,
    String? title,
    String? url,
    String? pathimg,
  }) {
    return TeachModel(
      description: description ?? this.description,
      time: time ?? this.time,
      title: title ?? this.title,
      url: url ?? this.url,
      pathimg: pathimg ?? this.pathimg,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'time': time,
      'title': title,
      'url': url,
      'pathimg': pathimg,
    };
  }

  factory TeachModel.fromMap(Map<String, dynamic> map) {
    return TeachModel(
      description: map['description'] as String,
      time: map['time'] as String,
      title: map['title'] as String,
      url: map['url'] as String,
      pathimg: map['pathimg'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TeachModel.fromJson(String source) => TeachModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TeachModel(description: $description, time: $time, title: $title, url: $url, pathimg: $pathimg)';
  }

  @override
  bool operator ==(covariant TeachModel other) {
    if (identical(this, other)) return true;

    return
      other.description == description &&
          other.time == time &&
          other.title == title &&
          other.url == url &&
          other.pathimg == pathimg;
  }

  @override
  int get hashCode {
    return description.hashCode ^
    time.hashCode ^
    title.hashCode ^
    url.hashCode ^
    pathimg.hashCode;
  }
}