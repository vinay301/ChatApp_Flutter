import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chat_app/models/image_model.dart';

class ImageRepository {
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

  // Future<List<PixabayImage>> getNetworkImages() async {
  //   var endpoint = PixabayApi();
  //   try {
  //     List<PixabayImage> images = await endpoint.fetchImages();
  //     return images;
  //     //print(images[0].previewURL);
  //     // for (var image in images) {
  //     //   print('Image URL: ${image.previewURL}');
  //     // }
  //   } catch (e) {
  //     throw Exception('Error fetching images: $e');
  //   }
  // }
}
