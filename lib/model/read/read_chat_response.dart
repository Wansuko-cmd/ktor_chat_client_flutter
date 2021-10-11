import 'package:ktor_chat_client_flutter/model/message.dart';

class ReadChatResponse{

  final String id;
  final String userName;
  final String text;

  ReadChatResponse(this.id, this.userName, this.text);

  factory ReadChatResponse.fromJson(Map<String, dynamic> json) => ReadChatResponse(
      json["id"],
      json["user_name"],
      json["text"]
  );


  static Message toMessage(ReadChatResponse readChatResponse) {
    return Message(
        readChatResponse.id,
        readChatResponse.userName,
        readChatResponse.text
    );
  }
}