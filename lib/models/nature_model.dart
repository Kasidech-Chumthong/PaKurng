// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NatureModel {
  final String soundname;
  final String detailsong;
  final String time;
  final String pathimg;
  final String url;
  NatureModel({
    required this.soundname,
    required this.detailsong,
    required this.time,
    required this.pathimg,
    required this.url,
  });

  NatureModel copyWith({
    String? soundname,
    String? detailsong,
    String? time,
    String? pathimg,
    String? url,
  }) {
    return NatureModel(
      soundname: soundname ?? this.soundname,
      detailsong: detailsong ?? this.detailsong,
      time: time ?? this.time,
      pathimg: pathimg ?? this.pathimg,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'soundname': soundname,
      'detailsong': detailsong,
      'time': time,
      'pathimg': pathimg,
      'url': url,
    };
  }

  factory NatureModel.fromMap(Map<String, dynamic> map) {
    return NatureModel(
      soundname: map['soundname'] as String,
      detailsong: map['detailsong'] as String,
      time: map['time'] as String,
      pathimg: map['pathimg'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NatureModel.fromJson(String source) => NatureModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NatureModel(soundname: $soundname, detailsong: $detailsong, time: $time, pathimg: $pathimg, url: $url)';
  }

  @override
  bool operator ==(covariant NatureModel other) {
    if (identical(this, other)) return true;

    return
      other.soundname == soundname &&
          other.detailsong == detailsong &&
          other.time == time &&
          other.pathimg == pathimg &&
          other.url == url;
  }

  @override
  int get hashCode {
    return soundname.hashCode ^
    detailsong.hashCode ^
    time.hashCode ^
    pathimg.hashCode ^
    url.hashCode;
  }
}