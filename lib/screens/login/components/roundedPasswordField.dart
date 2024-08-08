import 'package:chat_app/screens/login/components/textFieldContainer.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController passwordController;
  const RoundedPasswordField({
    super.key,
    required this.onChanged,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextFormField(
      validator: (value) {
        if (value != null && value.isNotEmpty && value.length < 5) {
          return "Your password should be more than 5 characters";
        } else if (value != null && value.isEmpty) {
          return "Please type your password";
        }
        return null;
      },
      controller: passwordController,
      obscureText: true,
      onChanged: onChanged,
      decoration: const InputDecoration(
        hintText: "Password",
        icon: Icon(
          Icons.lock,
          color: primaryColor,
        ),
        suffixIcon: Icon(Icons.visibility, color: primaryColor),
        border: InputBorder.none,
      ),
    ));
  }
}
