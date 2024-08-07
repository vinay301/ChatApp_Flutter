import 'package:chat_app/models/ChatMessage.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';

class ImageMessage extends StatelessWidget {
  final ChatMessage message;
  const ImageMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset("assets/images/login.png"),
            ),
          ],
        ),
      ),
    );
  }
}
