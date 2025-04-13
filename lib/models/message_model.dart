import 'package:scholar_chat/constants.dart';

class MessageModel {
  String? email;

  String? message;
  DateTime? timestamp;

  MessageModel({this.email, this.message, this.timestamp});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      email: json[kMessageEmail],

      message: json[kMessageText],
      timestamp: DateTime.parse(json[kMessageTimestamp]),
    );
  }
}
