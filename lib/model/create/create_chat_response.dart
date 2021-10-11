import 'package:ktor_chat_client_flutter/model/message.dart';

class CreateChatResponse{

  final String id;
  final String userName;
  final String text;

  CreateChatResponse(this.id, this.userName, this.text);

  factory CreateChatResponse.fromJson(Map<String, dynamic> json) => CreateChatResponse(
      json["id"],
      json["user_name"],
      json["text"]
  );


  static Message toMessage(CreateChatResponse createChatResponse) {
    return Message(
        createChatResponse.id,
        createChatResponse.userName,
        createChatResponse.text
    );
  }
}