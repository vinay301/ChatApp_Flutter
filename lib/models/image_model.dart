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

class PixabayApi {
  final String apiKey = '45395533-2520ea528090e821d5a9ed576';

  Future<List<PixabayImage>> fetchImages() async {
    final String url =
        'https://pixabay.com/api/?key=$apiKey&q=all&image_type=photo';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //print(response.body);
      List<dynamic> jsonList = jsonDecode(response.body)['hits'];
      return jsonList.map((json) => PixabayImage.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load images');
    }
  }
}
