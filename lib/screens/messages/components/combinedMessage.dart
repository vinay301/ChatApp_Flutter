import 'package:flutter/material.dart';
import 'package:chat_app/models/ChatMessage.dart';
import 'package:chat_app/utils/constants.dart';

class CombinedMessage extends StatelessWidget {
  const CombinedMessage({super.key, required this.message});
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.5,
      ),
      padding: EdgeInsets.all(defaultPadding * 0.75),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(message.isSender ? 1 : 0.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.text,
            style: TextStyle(
              color: message.isSender
                  ? Colors.white
                  : Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          SizedBox(height: defaultPadding / 2),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              message.imageUrl!,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
