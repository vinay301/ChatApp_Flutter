import 'package:chat_app/screens/login/components/textFieldContainer.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    super.key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        icon: Icon(
          icon,
          color: primaryColor,
        ),
        hintText: "Your Email",
        border: InputBorder.none,
      ),
    ));
  }
}
