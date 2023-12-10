import 'package:freezed_annotation/freezed_annotation.dart';

part '../gen/rating_model.freezed.dart';
part '../gen/rating_model.g.dart';


@freezed
class Rating with _$Rating {
  const factory Rating({
    required String userId,
    required double rating,
  }) = _Rating;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}
