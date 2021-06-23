import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';


@JsonSerializable()
class Product {
  int id;
  int pCode;


  Product({
    required this.id,
    required this.pCode,

  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
