import 'package:chat_app/models/ChatMessage.dart';
import 'package:chat_app/models/image_model.dart';
import 'package:chat_app/repository/image_repo.dart';
import 'package:chat_app/screens/messages/components/chatInputField.dart';
import 'package:chat_app/screens/messages/components/message.dart';
import 'package:chat_app/screens/messages/components/textMessage.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final chatController = TextEditingController();
  // final PixabayApi api = PixabayApi();
  //List<PixabayImage> images = [];
  final ImageRepository _imageRepository = ImageRepository();
  // late Future<List<PixelFormImage>> imageResponse;

  void onMessageSent(ChatMessage newChatMessage) {
    demoChatMessages.add(newChatMessage);
    setState(() {});
  }

  Future<List<PixabayImage>> _getNetworkImages() async {
    try {
      List<PixabayImage> imageResponse = await _imageRepository.fetchImages();
      return imageResponse;
    } catch (e) {
      throw Exception('Error fetching images: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _getNetworkImages();
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
          getNetworkImages: _getNetworkImages),
    ]);
  }
}
