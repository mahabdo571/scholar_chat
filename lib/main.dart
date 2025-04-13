import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/firebase_options.dart';
import 'package:scholar_chat/pages/chat_page.dart';
import 'package:scholar_chat/pages/login_page.dart';
import 'package:scholar_chat/pages/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scholar Chat',
      routes: {
        LoginPage.routeId: (ctx) => LoginPage(),
        RegisterPage.routeId: (ctx) => RegisterPage(),
        ChatPage.routeId: (ctx) => ChatPage(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: LoginPage.routeId,
    );
  }
}
