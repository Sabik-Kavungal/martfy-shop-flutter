// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      name: json['name'] as String?,
      description: json['description'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      category: json['category'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      id: json['_id'] as String?,
      rating: (json['rating'] as List<dynamic>?)
          ?.map((e) => Rating.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  writeNotNull('quantity', instance.quantity);
  writeNotNull('images', instance.images);
  writeNotNull('category', instance.category);
  writeNotNull('price', instance.price);
  writeNotNull('_id', instance.id);
  writeNotNull('rating', instance.rating?.map((e) => e.toJson()).toList());
  return val;
}
