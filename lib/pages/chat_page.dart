import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/models/message_model.dart';
import 'package:scholar_chat/widgets/chat_buble.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatefulWidget {
  static String routeId = 'chatPage';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  CollectionReference messageCollection = FirebaseFirestore.instance.collection(
    kMessagesCollection,
  );

  TextEditingController messageController = TextEditingController();

  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    final Stream<QuerySnapshot> _usersStream =
        messageCollection
            .orderBy(kMessageTimestamp, descending: true)
            .snapshots();

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
            child: StreamBuilder<QuerySnapshot>(
              stream: _usersStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                return ListView(
                  controller: _controller,
                  reverse: true,
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return ChatBuble(message: data[kMessageText]);
                      }).toList(),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: messageController,
              onSubmitted: (value) {
                messageCollection.add({
                  kMessageText: value,
                  kMessageTimestamp: FieldValue.serverTimestamp(),
                  kMessageEmail: email,
                });
                messageController.clear();
                _controller.animateTo(
                  0,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
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
