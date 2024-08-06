import 'package:chat_app/screens/messages/components/body.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';

class Messagescreen extends StatelessWidget {
  const Messagescreen({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: BuildAppBar(size),
      body: const Body(),
    );
  }

  AppBar BuildAppBar(Size size) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: size.height * 0.12,
      title: SafeArea(
        top: true,
        bottom: false,
        child: Row(
          children: [
            const BackButton(
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: Icon(Icons.person, color: primaryColor),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Username',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                Text('Online',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.7), fontSize: 14))
              ],
            ),
          ],
        ),
      ),
      backgroundColor: primaryColor,
    );
  }
}
