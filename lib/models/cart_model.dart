import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:martfy/models/product_model.dart';

part '../gen/cart_model.freezed.dart';
part '../gen/cart_model.g.dart';

@freezed
class CartModel with _$CartModel {
  const factory CartModel({
    @JsonKey(name: 'product') Product? product,
    @JsonKey(name: 'quantity') int? quantity,
    @JsonKey(name: '_id') String? id,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
}
