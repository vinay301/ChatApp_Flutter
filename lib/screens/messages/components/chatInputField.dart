import 'package:chat_app/models/ChatMessage.dart';
import 'package:chat_app/models/image_model.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:chat_app/widget/image_picker_body.dart';
import 'package:flutter/material.dart';

class ChatInputField extends StatelessWidget {
  final TextEditingController chatController;
  final Function(ChatMessage) onChatSubmit;
  final Future<List<PixabayImage>> Function() getNetworkImages;
  const ChatInputField(
      {super.key,
      required this.chatController,
      required this.onChatSubmit,
      required this.getNetworkImages});
  void onMsgSend() {
    //print(chatController.text);

    final newMessage = ChatMessage(
        text: chatController.text,
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.not_view,
        isSender: true);
    onChatSubmit(newMessage);
  }

  onImagePicked(String newImageUrl) {}
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding / 2),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 32,
                color: const Color(0xFF087949).withOpacity(0.08))
          ]),
      child: SafeArea(
        child: Row(
          children: [
            const Icon(Icons.mic, color: primaryColor),
            const SizedBox(width: defaultPadding),
            Expanded(
                child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding * 0.75),
              height: 50,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  const Icon(Icons.sentiment_satisfied_alt_outlined),
                  const SizedBox(width: defaultPadding / 4),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      minLines: 1,
                      controller: chatController,
                      decoration: const InputDecoration(
                          hintText: "Type message", border: InputBorder.none),
                    ),
                  ),
                  IconButton(
                    onPressed: onMsgSend,
                    icon: const Icon(Icons.attach_file),
                  ),
                  const SizedBox(width: defaultPadding / 4),
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return NetworkImagePickerBody(
                                  getNetworkImages: getNetworkImages,
                                  onImageSelected: onImagePicked);
                            });
                      },
                      icon: const Icon(Icons.camera_alt_outlined))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
