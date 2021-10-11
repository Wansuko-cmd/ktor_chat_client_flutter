import 'dart:async';
import 'dart:convert';

import 'package:ktor_chat_client_flutter/model/message.dart';
import 'package:ktor_chat_client_flutter/model/read/read_chat_response.dart';
import 'package:http/http.dart' as http;

class ChatService {

  static const _url = 'https://ktor-chat-app.herokuapp.com/chat';

  Future<List<Message>> getMessage() async {
    try{
      final response = await http.get(Uri.parse(_url));

      // print("GET");
      // print(response);
      //
      // print(json.decode(response.body));

      return (json.decode(response.body) as List)
          .map((e) => ReadChatResponse.fromJson(e))
          .toList()
          .map((e) => ReadChatResponse.toMessage(e))
          .toList();
    }
    on Exception catch(e) {
      print(e);
      rethrow;
    }
  }
}