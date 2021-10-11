import 'package:flutter/material.dart';
import 'package:ktor_chat_client_flutter/model/message.dart';
import 'package:ktor_chat_client_flutter/service/chat_service.dart';

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

  List<Message>? message;

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
      ),
      body: ListView.separated(
        itemCount: message != null ? message!.length : 0,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(message != null ? message![index].text : ""),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.black,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getMessages,
        tooltip: 'Increment',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  void _getMessages() async{
    message = await chatService.getMessages();
    setState((){});
  }

  void _createMessages() async{
    await chatService.createMessage("userName", "TEST");
  }
}
