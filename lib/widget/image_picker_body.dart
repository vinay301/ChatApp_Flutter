import 'package:chat_app/models/image_model.dart';
import 'package:chat_app/repository/image_repo.dart';
import 'package:flutter/material.dart';

class NetworkImagePickerBody extends StatelessWidget {
  final Future<List<PixabayImage>> Function() getNetworkImages;
  final Function(String) onImageSelected;
  const NetworkImagePickerBody(
      {super.key,
      required this.getNetworkImages,
      required this.onImageSelected});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getNetworkImages(),
        builder:
            (BuildContext context, AsyncSnapshot<List<PixabayImage>> snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        onImageSelected(snapshot.data![index].previewURL);
                      },
                      child: Image.network(snapshot.data![index].previewURL));
                },
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                ));
            // return Image.network(snapshot.data![0].previewURL);
          }
          return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: CircularProgressIndicator()));
        });
  }
}
