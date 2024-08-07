import 'package:chat_app/models/ChatMessage.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({super.key, required this.message});
  final ChatMessage message;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: defaultPadding * 0.75, vertical: defaultPadding / 2),
        decoration: BoxDecoration(
            color: primaryColor.withOpacity(message.isSender ? 1 : 0.08),
            borderRadius: BorderRadius.circular(30)),
        child: Text(
          message.text,
          style: TextStyle(
              color: message.isSender
                  ? Colors.white
                  : Theme.of(context).textTheme.bodyLarge?.color),
        ));
  }
}
