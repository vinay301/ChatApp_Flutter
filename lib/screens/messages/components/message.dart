import 'package:chat_app/models/ChatMessage.dart';
import 'package:chat_app/screens/messages/components/audioMessage.dart';
import 'package:chat_app/screens/messages/components/imageMessage.dart';
import 'package:chat_app/screens/messages/components/messageDot.dart';
import 'package:chat_app/screens/messages/components/textMessage.dart';
import 'package:chat_app/screens/messages/components/videoMessage.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({super.key, required this.message});

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    Widget messageContent(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(message: message);
          break;
        case ChatMessageType.audio:
          return AudioMessage(message: message);
          break;
        case ChatMessageType.video:
          return VideoMessage(message: message);
          break;
        case ChatMessageType.image:
          return ImageMessage(message: message);
          break;
        default:
          return SizedBox();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: defaultPadding),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            const CircleAvatar(
              radius: 12,
              child: Icon(
                Icons.person,
                size: 16,
              ),
            ),
            const SizedBox(
              width: defaultPadding / 2,
            )
          ],
          messageContent(message),
          if (message.isSender) MessageStatusDot(status: message.messageStatus)
        ],
      ),
    );
  }
}
