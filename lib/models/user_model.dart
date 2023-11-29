import 'package:freezed_annotation/freezed_annotation.dart';



part '../gen/user_model.freezed.dart';
part '../gen/user_model.g.dart';


// part '../user_model.freezed.dart';
// part '../user_model.g.dart';
// part 'user_model.freezed.dart';
// part 'user_model.g.dart';

@freezed
class User with _$User {
  factory User({
    String? id,
    String? name,
    String? email,
    String? password,
    String? address,
    String? type,
    String? token,
    @Default([]) List<dynamic> cart,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
