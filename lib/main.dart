import 'package:chat_app/screens/login/login_page.dart';
import 'package:chat_app/screens/messages/messageScreen.dart';
import 'package:chat_app/screens/welcome/welcome_page.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.init();
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => AuthService(),
    child: const ChatApp(),
  ));
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    String? username = context.read<AuthService>().getUserName();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      themeMode: ThemeMode.system,
      home: FutureBuilder(
          future: context.read<AuthService>().isLoggedIn(),
          builder: (context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData && snapshot.data!) {
                return Messagescreen(username: username!);
              } else {
                return const LoginPage();
              }
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
