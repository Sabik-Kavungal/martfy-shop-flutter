// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RatingImpl _$$RatingImplFromJson(Map<String, dynamic> json) => _$RatingImpl(
      userId: json['userId'] as String,
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$$RatingImplToJson(_$RatingImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'rating': instance.rating,
    };
