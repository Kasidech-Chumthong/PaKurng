// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Market1Model {
  final String priceproduct;
  final String detailproduct;
  final String ig;
  final String indepthproduct;
  final String phone;
  final String product;
  final String nameshop;
  final String front;
  final String back;
  final String pathimg;
  Market1Model({
    required this.priceproduct,
    required this.detailproduct,
    required this.ig,
    required this.indepthproduct,
    required this.phone,
    required this.product,
    required this.nameshop,
    required this.front,
    required this.back,
    required this.pathimg,
  });

  Market1Model copyWith({
    String? priceproduct,
    String? detailproduct,
    String? ig,
    String? indepthproduct,
    String? phone,
    String? product,
    String? nameshop,
    String? front,
    String? back,
    String? pathimg,
  }) {
    return Market1Model(
      priceproduct: priceproduct ?? this.priceproduct,
      detailproduct: detailproduct ?? this.detailproduct,
      ig: ig ?? this.ig,
      indepthproduct: indepthproduct ?? this.indepthproduct,
      phone: phone ?? this.phone,
      product: product ?? this.product,
      nameshop: nameshop ?? this.nameshop,
      front: front ?? this.front,
      back: back ?? this.back,
      pathimg: pathimg ?? this.pathimg,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'priceproduct': priceproduct,
      'detailproduct': detailproduct,
      'ig': ig,
      'indepthproduct': indepthproduct,
      'phone': phone,
      'product': product,
      'nameshop': nameshop,
      'front': front,
      'back': back,
      'pathimg': pathimg,
    };
  }

  factory Market1Model.fromMap(Map<String, dynamic> map) {
    return Market1Model(
      priceproduct: map['priceproduct'] as String,
      detailproduct: map['detailproduct'] as String,
      ig: map['ig'] as String,
      indepthproduct: map['indepthproduct'] as String,
      phone: map['phone'] as String,
      product: map['product'] as String,
      nameshop: map['nameshop'] as String,
      front: map['front'] as String,
      back: map['back'] as String,
      pathimg: map['pathimg'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Market1Model.fromJson(String source) => Market1Model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Market1Model(priceproduct: $priceproduct, detailproduct: $detailproduct, ig: $ig, indepthproduct: $indepthproduct, phone: $phone, product: $product, nameshop: $nameshop, front: $front, back: $back, pathimg: $pathimg)';
  }

  @override
  bool operator ==(covariant Market1Model other) {
    if (identical(this, other)) return true;

    return
      other.priceproduct == priceproduct &&
          other.detailproduct == detailproduct &&
          other.ig == ig &&
          other.indepthproduct == indepthproduct &&
          other.phone == phone &&
          other.product == product &&
          other.nameshop == nameshop &&
          other.front == front &&
          other.back == back &&
          other.pathimg == pathimg;
  }

  @override
  int get hashCode {
    return priceproduct.hashCode ^
    detailproduct.hashCode ^
    ig.hashCode ^
    indepthproduct.hashCode ^
    phone.hashCode ^
    product.hashCode ^
    nameshop.hashCode ^
    front.hashCode ^
    back.hashCode ^
    pathimg.hashCode;
  }
}