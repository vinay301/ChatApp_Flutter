import 'package:chat_app/screens/login/components/background.dart';
import 'package:chat_app/screens/login/components/roundedInputField.dart';
import 'package:chat_app/screens/login/components/roundedPasswordField.dart';
import 'package:chat_app/screens/messages/messageScreen.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
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
          hintText: "Your Email",
          onChanged: (value) {},
        ),
        RoundedPasswordField(
          onChanged: (value) {},
        ),
        SizedBox(
          width: size.width * 0.9,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Messagescreen();
                  }));
                },
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
    ));
  }
}
