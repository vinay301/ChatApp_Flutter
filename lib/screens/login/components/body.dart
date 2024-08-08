import 'package:chat_app/screens/login/components/background.dart';
import 'package:chat_app/screens/login/components/roundedInputField.dart';
import 'package:chat_app/screens/login/components/roundedPasswordField.dart';
import 'package:chat_app/screens/messages/messageScreen.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  Body({super.key});

  final userEmailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void loginUser(context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      print(userEmailController.text);
      print(passwordController.text);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Messagescreen(
          username: userEmailController.text,
        );
      }));
    } else {
      print('Login Failed!');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'LOGIN',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          Image.asset(
            "assets/images/login.png",
            height: size.height * 0.35,
          ),
          RoundedInputField(
            hintText: "Username",
            userEmailController: userEmailController,
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            passwordController: passwordController,
            onChanged: (value) {},
          ),
          SizedBox(
            width: size.width * 0.9,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: ElevatedButton(
                  onPressed: () {
                    loginUser(context);
                  },
                  // onPressed: () {
                  //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //     return const Messagescreen();
                  //   }));
                  // },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 15)),
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          )
        ],
      ),
    ));
  }
}
