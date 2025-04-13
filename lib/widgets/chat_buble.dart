import 'package:flutter/material.dart';
import 'package:scholar_chat/constants.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 150,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 16),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Text(
        "test test test ",
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}
