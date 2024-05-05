// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PrayerModel {
  final String nameprayer;
  final String imgprayer;
  final String type;
  final String prayer;
  final String end;
  final String benefit;
  PrayerModel({
    required this.nameprayer,
    required this.imgprayer,
    required this.type,
    required this.prayer,
    required this.end,
    required this.benefit,
  });

  PrayerModel copyWith({
    String? nameprayer,
    String? imgprayer,
    String? type,
    String? prayer,
    String? end,
    String? benefit,
  }) {
    return PrayerModel(
      nameprayer: nameprayer ?? this.nameprayer,
      imgprayer: imgprayer ?? this.imgprayer,
      type: type ?? this.type,
      prayer: prayer ?? this.prayer,
      end: end ?? this.end,
      benefit: benefit ?? this.benefit,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nameprayer': nameprayer,
      'imgprayer': imgprayer,
      'type': type,
      'prayer': prayer,
      'end': end,
      'benefit': benefit,
    };
  }

  factory PrayerModel.fromMap(Map<String, dynamic> map) {
    return PrayerModel(
      nameprayer: map['nameprayer'] as String,
      imgprayer: map['imgprayer'] as String,
      type: map['type'] as String,
      prayer: map['prayer'] as String,
      end: map['end'] as String,
      benefit: map['benefit'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PrayerModel.fromJson(String source) => PrayerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PrayerModel(nameprayer: $nameprayer, imgprayer: $imgprayer, type: $type, prayer: $prayer, end: $end, benefit: $benefit)';
  }

  @override
  bool operator ==(covariant PrayerModel other) {
    if (identical(this, other)) return true;

    return
      other.nameprayer == nameprayer &&
          other.imgprayer == imgprayer &&
          other.type == type &&
          other.prayer == prayer &&
          other.end == end &&
          other.benefit == benefit;
  }

  @override
  int get hashCode {
    return nameprayer.hashCode ^
    imgprayer.hashCode ^
    type.hashCode ^
    prayer.hashCode ^
    end.hashCode ^
    benefit.hashCode;
  }
}