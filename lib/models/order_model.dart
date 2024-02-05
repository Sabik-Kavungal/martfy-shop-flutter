import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:martfy/models/cart_model.dart';
import 'package:martfy/models/product_model.dart';

part '../gen/order_model.freezed.dart';
part '../gen/order_model.g.dart';

@freezed
class Order with _$Order {
  factory Order({
    @JsonKey(name: 'productList') List<OrderProduct>? productList,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'userId') String? userId,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
class OrderProduct with _$OrderProduct {
  factory OrderProduct({
    @JsonKey(name: 'product') Product? product,
    @JsonKey(name: 'quantity') int? quantity,
  }) = _OrderProduct;

  factory OrderProduct.fromJson(Map<String, dynamic> json) =>
      _$OrderProductFromJson(json);
}