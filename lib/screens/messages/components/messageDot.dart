import 'package:chat_app/models/ChatMessage.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';

class MessageStatusDot extends StatelessWidget {
  final MessageStatus status;
  const MessageStatusDot({super.key, required this.status});
  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.not_Sent:
          return errorColor;
          break;
        case MessageStatus.not_view:
          return Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.1);
          break;
        case MessageStatus.viewed:
          return primaryColor;
          break;
        default:
          return Colors.transparent;
      }
    }

    return Container(
        margin: EdgeInsets.only(left: defaultPadding / 2),
        height: 12,
        width: 12,
        decoration:
            BoxDecoration(color: dotColor(status), shape: BoxShape.circle),
        child: Icon(status == MessageStatus.not_Sent ? Icons.close : Icons.done,
            size: 8, color: Theme.of(context).scaffoldBackgroundColor));
  }
}
