// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PrayersModel {
  final String title;
  final String time;
  final String url;
  final String description;
  final String pathimg;
  PrayersModel({
    required this.title,
    required this.time,
    required this.url,
    required this.description,
    required this.pathimg,
  });

  PrayersModel copyWith({
    String? title,
    String? time,
    String? url,
    String? description,
    String? pathimg,
  }) {
    return PrayersModel(
      title: title ?? this.title,
      time: time ?? this.time,
      url: url ?? this.url,
      description: description ?? this.description,
      pathimg: pathimg ?? this.pathimg,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'time': time,
      'url': url,
      'description': description,
      'pathimg': pathimg,
    };
  }

  factory PrayersModel.fromMap(Map<String, dynamic> map) {
    return PrayersModel(
      title: map['title'] as String,
      time: map['time'] as String,
      url: map['url'] as String,
      description: map['description'] as String,
      pathimg: map['pathimg'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PrayersModel.fromJson(String source) => PrayersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PrayersModel(title: $title, time: $time, url: $url, description: $description, pathimg: $pathimg)';
  }

  @override
  bool operator ==(covariant PrayersModel other) {
    if (identical(this, other)) return true;

    return
      other.title == title &&
          other.time == time &&
          other.url == url &&
          other.description == description &&
          other.pathimg == pathimg;
  }

  @override
  int get hashCode {
    return title.hashCode ^
    time.hashCode ^
    url.hashCode ^
    description.hashCode ^
    pathimg.hashCode;
  }
}