import 'package:ktor_chat_client_flutter/model/message.dart';

class CreateChatRequest{

  final String userName;
  final String text;

  CreateChatRequest(this.userName, this.text);

  Map<String, dynamic> toJson() => {
    "user_name": userName,
    "text": text,
  };
}