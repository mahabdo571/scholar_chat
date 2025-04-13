import 'package:scholar_chat/constants.dart';

class MessageModel {
  String? email;

  String? message;
  DateTime? timestamp;

  MessageModel({this.email, this.message, this.timestamp});

  Map<String, dynamic> toJson() {
    return {
      kMessageEmail: email,
      kMessageText: message,
      kMessageTimestamp: timestamp?.toIso8601String(),
    };
  }

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      email: json[kMessageEmail],

      message: json[kMessageText],
      timestamp: DateTime.parse(json[kMessageTimestamp]),
    );
  }
}
