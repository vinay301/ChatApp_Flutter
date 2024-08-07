import 'package:chat_app/models/ChatMessage.dart';
import 'package:chat_app/screens/messages/components/chatInputField.dart';
import 'package:chat_app/screens/messages/components/message.dart';
import 'package:chat_app/screens/messages/components/textMessage.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});
  @override
  Widget build(BuildContext context) {
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
      ChatInputField(),
    ]);
  }
}
