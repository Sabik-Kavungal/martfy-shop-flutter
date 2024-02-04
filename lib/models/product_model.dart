import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:martfy/models/rating_model.dart';

part '../gen/product_model.freezed.dart';
part '../gen/product_model.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    String? name,
    String? description,
    double? quantity,
    List<String>? images,
    String? category,
    double? price,
   @JsonKey(name:"_id") String? id,
    List<Rating>? rating,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
