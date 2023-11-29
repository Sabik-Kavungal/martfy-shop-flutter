// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      address: json['address'] as String?,
      type: json['type'] as String?,
      token: json['token'] as String?,
      cart: json['cart'] as List<dynamic>? ?? const [],
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('email', instance.email);
  writeNotNull('password', instance.password);
  writeNotNull('address', instance.address);
  writeNotNull('type', instance.type);
  writeNotNull('token', instance.token);
  val['cart'] = instance.cart;
  return val;
}
