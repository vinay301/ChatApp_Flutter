import 'package:chat_app/screens/messages/components/body.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Messagescreen extends StatefulWidget {
  final String username;
  const Messagescreen({super.key, required this.username});

  @override
  State<Messagescreen> createState() => _MessagescreenState();
}

class _MessagescreenState extends State<Messagescreen> {
  String? userNameFromCache;

  @override
  void initState() {
    super.initState();
    _fetchUserName();
  }

  Future<void> _fetchUserName() async {
    final userName = await context.read<AuthService>().getUserName();
    setState(() {
      userNameFromCache = userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //double statusBarHeight = MediaQuery.of(context).padding.top;
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: buildAppBar(size, context),
        body: const Body(),
      ),
    );
  }

  AppBar buildAppBar(Size size, BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: size.height * 0.12,
      title: Row(
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
              Text(userNameFromCache!,
                  style: const TextStyle(color: Colors.white, fontSize: 18)),
              Text('Online',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.7), fontSize: 14))
            ],
          ),
        ],
      ),
      backgroundColor: primaryColor,
    );
  }
}
