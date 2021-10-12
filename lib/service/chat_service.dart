import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:ktor_chat_client_flutter/model/create/create_chat_request.dart';
import 'package:ktor_chat_client_flutter/model/message.dart';
import 'package:ktor_chat_client_flutter/model/read/read_chat_response.dart';
import 'package:http/http.dart' as http;
import 'package:ktor_chat_client_flutter/model/update/update_chat_request.dart';

class ChatService {

  static const _url = 'https://ktor-chat-app.herokuapp.com/chat';

  Future<List<Message>> getMessages() async {
    try{
      final response = await http.get(Uri.parse(_url));

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

  Future<bool> createMessage(String userName, String text) async {

    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(_url));

    //ヘッダーをセット
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(CreateChatRequest(userName, text).toJson())));

    //取得
    HttpClientResponse response = await request.close();
    httpClient.close();
    return response.statusCode == 200;

  }

  Future<bool> updateMessage(String id, String userName, String text) async {

    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.putUrl(Uri.parse(_url));

    //ヘッダーをセット
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(UpdateChatRequest(id, userName, text).toJson())));

    //取得
    HttpClientResponse response = await request.close();
    httpClient.close();
    return response.statusCode == 200;
  }

  Future<bool> deleteMessage(String id) async {

    try{
      final response = await http.delete(Uri.parse('$_url/$id'));

      return response.statusCode == 200;
    }
    on Exception catch(e) {
      print(e);
      rethrow;
    }
  }
}