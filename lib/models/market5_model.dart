// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Market5Model {
  final String priceproduct;
  final String detailproduct;
  final String ig;
  final String indepthproduct;
  final String phone;
  final String product;
  final String nameshop;
  final String pathimg;
  final String front;
  final String back;
  Market5Model({
    required this.priceproduct,
    required this.detailproduct,
    required this.ig,
    required this.indepthproduct,
    required this.phone,
    required this.product,
    required this.nameshop,
    required this.pathimg,
    required this.front,
    required this.back,
  });

  Market5Model copyWith({
    String? priceproduct,
    String? detailproduct,
    String? ig,
    String? indepthproduct,
    String? phone,
    String? product,
    String? nameshop,
    String? pathimg,
    String? front,
    String? back,
  }) {
    return Market5Model(
      priceproduct: priceproduct ?? this.priceproduct,
      detailproduct: detailproduct ?? this.detailproduct,
      ig: ig ?? this.ig,
      indepthproduct: indepthproduct ?? this.indepthproduct,
      phone: phone ?? this.phone,
      product: product ?? this.product,
      nameshop: nameshop ?? this.nameshop,
      pathimg: pathimg ?? this.pathimg,
      front: front ?? this.front,
      back: back ?? this.back,
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
      'pathimg': pathimg,
      'front': front,
      'back': back,
    };
  }

  factory Market5Model.fromMap(Map<String, dynamic> map) {
    return Market5Model(
      priceproduct: map['priceproduct'] as String,
      detailproduct: map['detailproduct'] as String,
      ig: map['ig'] as String,
      indepthproduct: map['indepthproduct'] as String,
      phone: map['phone'] as String,
      product: map['product'] as String,
      nameshop: map['nameshop'] as String,
      pathimg: map['pathimg'] as String,
      front: map['front'] as String,
      back: map['back'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Market5Model.fromJson(String source) => Market5Model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Market5Model(priceproduct: $priceproduct, detailproduct: $detailproduct, ig: $ig, indepthproduct: $indepthproduct, phone: $phone, product: $product, nameshop: $nameshop, pathimg: $pathimg, front: $front, back: $back)';
  }

  @override
  bool operator ==(covariant Market5Model other) {
    if (identical(this, other)) return true;

    return
      other.priceproduct == priceproduct &&
          other.detailproduct == detailproduct &&
          other.ig == ig &&
          other.indepthproduct == indepthproduct &&
          other.phone == phone &&
          other.product == product &&
          other.nameshop == nameshop &&
          other.pathimg == pathimg &&
          other.front == front &&
          other.back == back;
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
    pathimg.hashCode ^
    front.hashCode ^
    back.hashCode;
  }
}