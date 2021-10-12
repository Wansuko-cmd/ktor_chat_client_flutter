import 'package:flutter/material.dart';
import 'package:ktor_chat_client_flutter/model/message.dart';
import 'package:ktor_chat_client_flutter/service/chat_service.dart';
import 'package:ktor_chat_client_flutter/view/dialog/alert_message.dart';
import 'package:ktor_chat_client_flutter/view/dialog/create_alert_dialog.dart';
import 'package:ktor_chat_client_flutter/view/message_list_tile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  ChatService chatService = ChatService();

  List<Message> message = [];

  @override
  void initState(){
    super.initState();
    _getMessages();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _getMessages,
          )
        ],
      ),
      body: ListView.separated(
        itemCount: message.length ,
        itemBuilder: (context, index) {
          return MessageListTile(
            userName: message[index].userName,
            text: message[index].text,
            onDeletePressed: () => _deleteMessage(message[index].id),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.black,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createMessage(context),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  void _getMessages() async{
    message = await chatService.getMessages();
    setState((){});
  }

  void _createMessage(BuildContext context) async{
    AlertMessage alertMessage = await showDialog(
        context: context,
        builder: (context) => CreateAlertDialog()
    );
    bool result = await chatService.createMessage(alertMessage.userName, alertMessage.text);
    if(result) _getMessages();
  }

  void _deleteMessage(String id) async {
    bool result = await chatService.deleteMessage(id);
    if(result) _getMessages();
  }
}
