import 'package:chat_app/screens/login/components/textFieldContainer.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController userEmailController;

  const RoundedInputField({
    super.key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
    required this.userEmailController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: (value) {
          if (value != null && value.isNotEmpty && value.length < 5) {
            return "Your username should be more than 5 characters";
          } else if (value != null && value.isEmpty) {
            return "Please type your username";
          }
          return null;
        },
        controller: userEmailController,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: primaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
