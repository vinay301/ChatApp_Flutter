import 'package:chat_app/screens/messages/components/chatInputField.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [ 
      Spacer(), 
      Text('All your messages will be rendered here'),
      ChatInputField()],
    );
  }
}
