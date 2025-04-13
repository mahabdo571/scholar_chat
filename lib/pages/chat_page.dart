import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/widgets/chat_buble.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  static String routeId = 'chatPage';
  CollectionReference message = FirebaseFirestore.instance.collection(
    kMessageCollection,
  );
  TextEditingController messageController = TextEditingController();

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

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: 44,
              itemBuilder: (ctx, i) {
                return ChatBuble();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: messageController,
              onSubmitted: (value) {
                message.add({'message': value, 'createdAt': Timestamp.now()});
                messageController.clear();
              },
              decoration: InputDecoration(
                hintText: 'Type your message...',

                suffixIcon: Icon(Icons.send, color: kPrimaryColor),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: kPrimaryColor, width: 3),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: kPrimaryColor, width: 3),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: kPrimaryColor, width: 3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
