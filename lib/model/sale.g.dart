// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sale _$SaleFromJson(Map<String, dynamic> json) {
  return Sale(
    id: json['id'] as int,
    storeId: json['storeId'] as int,
    productId: json['productId'] as int,
    quantity: json['quantity'] as int,
    price: json['price'] as int,
    recordDate: DateTime.parse(json['recordDate'] as String),
    productCode: json['productCode'] as String,
  );
}

Map<String, dynamic> _$SaleToJson(Sale instance) => <String, dynamic>{
      'storeId': instance.storeId,
      'productId': instance.productId,
      'quantity': instance.quantity,
      'price': instance.price,
    };
