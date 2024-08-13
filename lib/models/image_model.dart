import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
part 'image_model.g.dart';

@JsonSerializable()
class PixabayImage {
  final String id;
  final String previewURL;
  final String largeImageURL;

  PixabayImage(
      {required this.id,
      required this.previewURL,
      required this.largeImageURL});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory PixabayImage.fromJson(Map<String, dynamic> json) =>
      _$PixabayImageFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PixabayImageToJson(this);
}
