import 'package:json_annotation/json_annotation.dart';

part 'sale.g.dart';

@JsonSerializable()
class Sale {
  int? id;
  int storeId;
  int productId;
  int quantity;
  int price;
  DateTime? recordDate;
  String? productCode;

  Sale({
    this.id,
    required this.storeId,
    required this.productId,
    required this.quantity,
    required this.price,
    this.recordDate,
    this.productCode,
  });

  factory Sale.fromJson(Map<String, dynamic> json) => _$SaleFromJson(json);

  Map<String, dynamic> toJson() => _$SaleToJson(this);
}
