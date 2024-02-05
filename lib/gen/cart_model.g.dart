// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartModelImpl _$$CartModelImplFromJson(Map<String, dynamic> json) =>
    _$CartModelImpl(
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$$CartModelImplToJson(_$CartModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('product', instance.product?.toJson());
  writeNotNull('quantity', instance.quantity);
  writeNotNull('_id', instance.id);
  return val;
}
