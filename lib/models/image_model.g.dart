// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PixabayImage _$PixabayImageFromJson(Map<String, dynamic> json) => PixabayImage(
      id: json['id'].toString(),
      previewURL: json['previewURL'] as String,
      largeImageURL: json['largeImageURL'] as String,
    );

Map<String, dynamic> _$PixabayImageToJson(PixabayImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'previewURL': instance.previewURL,
      'largeImageURL': instance.largeImageURL,
    };
