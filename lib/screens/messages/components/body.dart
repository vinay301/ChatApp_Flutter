import 'package:chat_app/models/ChatMessage.dart';
import 'package:chat_app/models/image_model.dart';
import 'package:chat_app/screens/messages/components/chatInputField.dart';
import 'package:chat_app/screens/messages/components/message.dart';
import 'package:chat_app/screens/messages/components/textMessage.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final chatController = TextEditingController();
  final PixabayApi api = PixabayApi();
  List<PixabayImage> images = [];
  // late Future<List<PixelFormImage>> imageResponse;

  void onMessageSent(ChatMessage newChatMessage) {
    demoChatMessages.add(newChatMessage);
    setState(() {});
  }

  _getNetworkImages() async {
    var endpoint = PixabayApi();
    try {
      List<PixabayImage> images = await endpoint.fetchImages();
      return images;
      //print(images[0].previewURL);
      // for (var image in images) {
      //   print('Image URL: ${image.previewURL}');
      // }
    } catch (e) {
      print('Error fetching images: $e');
    }
  }

  // Future<void> _getNetworkImages() async {
  //   try {
  //     List<PixabayImage> imageResponse = await api.fetchImages('');
  //     setState(() {
  //       images = imageResponse;
  //     });
  //   } catch (error) {
  //     print('Error fetching images: $error');
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    _getNetworkImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _getNetworkImages();
    return Column(children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: ListView.builder(
            itemCount: demoChatMessages.length,
            itemBuilder: (context, index) => Message(
              message: demoChatMessages[index],
            ),
          ),
        ),
      ),
      ChatInputField(
        chatController: chatController,
        onChatSubmit: onMessageSent,
      ),
    ]);
  }
}
