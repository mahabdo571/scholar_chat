import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/widgets/chat_buble.dart';

class ChatPage extends StatelessWidget {
  static String routeId = 'chatPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(kLogo, height: 50),
            Text('Chat', style: TextStyle(fontSize: 24, color: Colors.white)),
          ],
        ),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),

      body: ChatBuble(),
    );
  }
}
