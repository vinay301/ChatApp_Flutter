import 'package:chat_app/models/ChatMessage.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';

class ChatInputField extends StatelessWidget {
  final TextEditingController chatController;
  final Function(ChatMessage) onChatSubmit;
  const ChatInputField(
      {super.key, required this.chatController, required this.onChatSubmit});

  @override
  Widget build(BuildContext context) {
    void onMsgSend() {
      print(chatController.text);

      final newMessage = ChatMessage(
          text: chatController.text,
          messageType: ChatMessageType.text,
          messageStatus: MessageStatus.not_view,
          isSender: true);
      onChatSubmit(newMessage);
    }

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding / 2),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 32,
                color: Color(0xFF087949).withOpacity(0.08))
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
                      decoration: InputDecoration(
                          hintText: "Type message", border: InputBorder.none),
                    ),
                  ),
                  IconButton(
                    onPressed: onMsgSend,
                    icon: Icon(Icons.attach_file),
                  ),
                  SizedBox(width: defaultPadding / 4),
                  Icon(Icons.camera_alt_outlined)
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
