import 'package:flutter/material.dart';
import 'package:scholar_chat/constants.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key, required this.message, required this.isFriend});

  final String message;
  final bool isFriend;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isFriend ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 22, bottom: 22, right: 32),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isFriend ? Colors.blueGrey : kPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: isFriend ? Radius.circular(0) : Radius.circular(32),
            bottomLeft: isFriend ? Radius.circular(32) : Radius.circular(0),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
