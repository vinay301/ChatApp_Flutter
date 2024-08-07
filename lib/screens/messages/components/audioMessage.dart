import 'package:chat_app/models/ChatMessage.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';

class AudioMessage extends StatelessWidget {
  final ChatMessage message;
  const AudioMessage({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      height: 35,
      padding: EdgeInsets.symmetric(
          horizontal: defaultPadding * 0.75, vertical: defaultPadding / 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: primaryColor.withOpacity(message.isSender ? 1 : 0.1)),
      child: Row(children: [
        Icon(Icons.play_arrow,
            color: message.isSender ? Colors.white : primaryColor),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 2,
                color: message.isSender
                    ? Colors.white
                    : primaryColor.withOpacity(0.4),
              ),
              Positioned(
                left: 0,
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      color: message.isSender ? Colors.white : primaryColor,
                      shape: BoxShape.circle),
                ),
              )
            ],
          ),
        )),
        Text("0.35",
            style: TextStyle(
                fontSize: 12, color: message.isSender ? Colors.white : null))
      ]),
    );
  }
}
