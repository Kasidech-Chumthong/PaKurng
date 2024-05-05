// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MarketModel {
  String contact;
  String detailproduct1;
  String detailproduct2;
  String detailproduct3;
  String indepthproduct1;
  String indepthproduct2;
  String indepthproduct3;
  String nameshop;
  String opentime;
  String priceproduct1;
  String priceproduct2;
  String priceproduct3;
  String product1;
  String product2;
  String product3;
  String shopdetail;
  String pathimg;
  MarketModel({
    required this.contact,
    required this.detailproduct1,
    required this.detailproduct2,
    required this.detailproduct3,
    required this.indepthproduct1,
    required this.indepthproduct2,
    required this.indepthproduct3,
    required this.nameshop,
    required this.opentime,
    required this.priceproduct1,
    required this.priceproduct2,
    required this.priceproduct3,
    required this.product1,
    required this.product2,
    required this.product3,
    required this.shopdetail,
    required this.pathimg,
  });

  MarketModel copyWith({
    String? contact,
    String? detailproduct1,
    String? detailproduct2,
    String? detailproduct3,
    String? indepthproduct1,
    String? indepthproduct2,
    String? indepthproduct3,
    String? nameshop,
    String? opentime,
    String? priceproduct1,
    String? priceproduct2,
    String? priceproduct3,
    String? product1,
    String? product2,
    String? product3,
    String? shopdetail,
    String? pathimg,
  }) {
    return MarketModel(
      contact: contact ?? this.contact,
      detailproduct1: detailproduct1 ?? this.detailproduct1,
      detailproduct2: detailproduct2 ?? this.detailproduct2,
      detailproduct3: detailproduct3 ?? this.detailproduct3,
      indepthproduct1: indepthproduct1 ?? this.indepthproduct1,
      indepthproduct2: indepthproduct2 ?? this.indepthproduct2,
      indepthproduct3: indepthproduct3 ?? this.indepthproduct3,
      nameshop: nameshop ?? this.nameshop,
      opentime: opentime ?? this.opentime,
      priceproduct1: priceproduct1 ?? this.priceproduct1,
      priceproduct2: priceproduct2 ?? this.priceproduct2,
      priceproduct3: priceproduct3 ?? this.priceproduct3,
      product1: product1 ?? this.product1,
      product2: product2 ?? this.product2,
      product3: product3 ?? this.product3,
      shopdetail: shopdetail ?? this.shopdetail,
      pathimg: pathimg ?? this.pathimg,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'contact': contact,
      'detailproduct1': detailproduct1,
      'detailproduct2': detailproduct2,
      'detailproduct3': detailproduct3,
      'indepthproduct1': indepthproduct1,
      'indepthproduct2': indepthproduct2,
      'indepthproduct3': indepthproduct3,
      'nameshop': nameshop,
      'opentime': opentime,
      'priceproduct1': priceproduct1,
      'priceproduct2': priceproduct2,
      'priceproduct3': priceproduct3,
      'product1': product1,
      'product2': product2,
      'product3': product3,
      'shopdetail': shopdetail,
      'pathimg': pathimg,
    };
  }

  factory MarketModel.fromMap(Map<String, dynamic> map) {
    return MarketModel(
      contact: map['contact'] as String,
      detailproduct1: map['detailproduct1'] as String,
      detailproduct2: map['detailproduct2'] as String,
      detailproduct3: map['detailproduct3'] as String,
      indepthproduct1: map['indepthproduct1'] as String,
      indepthproduct2: map['indepthproduct2'] as String,
      indepthproduct3: map['indepthproduct3'] as String,
      nameshop: map['nameshop'] as String,
      opentime: map['opentime'] as String,
      priceproduct1: map['priceproduct1'] as String,
      priceproduct2: map['priceproduct2'] as String,
      priceproduct3: map['priceproduct3'] as String,
      product1: map['product1'] as String,
      product2: map['product2'] as String,
      product3: map['product3'] as String,
      shopdetail: map['shopdetail'] as String,
      pathimg: map['pathimg'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MarketModel.fromJson(String source) => MarketModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MarketModel(contact: $contact, detailproduct1: $detailproduct1, detailproduct2: $detailproduct2, detailproduct3: $detailproduct3, indepthproduct1: $indepthproduct1, indepthproduct2: $indepthproduct2, indepthproduct3: $indepthproduct3, nameshop: $nameshop, opentime: $opentime, priceproduct1: $priceproduct1, priceproduct2: $priceproduct2, priceproduct3: $priceproduct3, product1: $product1, product2: $product2, product3: $product3, shopdetail: $shopdetail, pathimg: $pathimg)';
  }

  @override
  bool operator ==(covariant MarketModel other) {
    if (identical(this, other)) return true;

    return
      other.contact == contact &&
          other.detailproduct1 == detailproduct1 &&
          other.detailproduct2 == detailproduct2 &&
          other.detailproduct3 == detailproduct3 &&
          other.indepthproduct1 == indepthproduct1 &&
          other.indepthproduct2 == indepthproduct2 &&
          other.indepthproduct3 == indepthproduct3 &&
          other.nameshop == nameshop &&
          other.opentime == opentime &&
          other.priceproduct1 == priceproduct1 &&
          other.priceproduct2 == priceproduct2 &&
          other.priceproduct3 == priceproduct3 &&
          other.product1 == product1 &&
          other.product2 == product2 &&
          other.product3 == product3 &&
          other.shopdetail == shopdetail &&
          other.pathimg == pathimg;
  }

  @override
  int get hashCode {
    return contact.hashCode ^
    detailproduct1.hashCode ^
    detailproduct2.hashCode ^
    detailproduct3.hashCode ^
    indepthproduct1.hashCode ^
    indepthproduct2.hashCode ^
    indepthproduct3.hashCode ^
    nameshop.hashCode ^
    opentime.hashCode ^
    priceproduct1.hashCode ^
    priceproduct2.hashCode ^
    priceproduct3.hashCode ^
    product1.hashCode ^
    product2.hashCode ^
    product3.hashCode ^
    shopdetail.hashCode ^
    pathimg.hashCode;
  }
}